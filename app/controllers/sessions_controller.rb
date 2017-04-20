
class SessionsController < ApplicationController
  # before_action :set_customer, only: :index

  def new
    if session[:customer_id]
      redirect_to customer_path( session[:customer_id] )
    end
  end

  def create
    @customer = Customer.find_by( email: params[:email] )
    @cook = Cook.find_by(email: params[:email])
    if !@customer.nil? && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
      redirect_to customer_path(@customer)
    elsif !@cook.nil? && @cook.authenticate(params[:password])
      session[:cook_id] = @cook.id
      session[:cook_name] = @cook.name
      redirect_to cook_path(@cook)
    else
      render :new
    end
  end

  def index
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
