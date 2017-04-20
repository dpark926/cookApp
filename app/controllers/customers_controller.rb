class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    # byebug
    if @customer.valid?
      @customer.save
      redirect_to customer_path(@customer)   #we want to log a customer in as soon as she creates profile
    else
      # render 'new'
      redirect_to new_customer_path
    end
  end

  def show
    get_customer
    get_customer_orders
  end

  def edit
    get_customer
  end

  def update
    get_customer
    @customer.update(customer_params)
    if @customer.valid?
      redirect_to customer_path
    else
      redirect_to edit_customer_path
    end
  end

  def destroy
    get_customer
    @customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :city, :image_url)
  end

  def get_customer
    @customer = Customer.find(params[:id])
  end

  def get_customer_orders
    get_customer
    @orders = @customer.orders
    # byebug
  end
end
