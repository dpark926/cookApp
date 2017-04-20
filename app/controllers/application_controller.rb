class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in? , :set_customer, :set_cook, :cook_own_page?
  #
  def set_customer
    if logged_in? && !cook?
      @customer = Customer.find(session[:customer_id])
    end
  end

  def set_cook
    if session[:cook_id]
      @cook = Cook.find(session[:cook_id])
    end
  end


  def logged_in?
    if session[:customer_id] || session[:cook_id]
      return true
    else
      return false
    end
  end

  def cook?
    if set_cook
      return true
    end
  end

  def cook_own_page?
    if session[:cook_id]
      set_cook.id == params[:id].to_i
    end
  end

end
