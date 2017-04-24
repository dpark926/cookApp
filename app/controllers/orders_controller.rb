class OrdersController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    get_customer
    @order = Order.new(customer_id: params[:customer_id], food_id: params[:order][:food_id])
    @food = Food.find(params[:order][:food_id])
    if @food.availability.to_i > 0
      @food.update(availability: Food.find(params[:order][:food_id]).availability.to_i - 1)
      if @order.valid?
        @order.save
        redirect_to customer_path(@customer)
      else
        redirect_to root_path
      end
    end
  end

  def show
    get_order
  end

  def edit
    get_order
  end

  def update
    get_order
    @order.update(order_params)
    if @order.valid?
      redirect_to order_path
    else
      redirect_to edit_order_path
    end
  end

  def destroy
    get_order
    get_customer
    @order.destroy
    redirect_to customer_path(@customer)
  end

  private

  # def order_params
  #   params.require(:order).permit(:customer_id, :order[:food_id])
  # end

  def get_order
    @order = Order.find(params[:id])
  end

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end
end
