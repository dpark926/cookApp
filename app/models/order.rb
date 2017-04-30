class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :food

  def self.customer_total(customer)
    Order.where(customer_id: customer.id).collect do |order|
      order.food.price
    end.sum
  end
end
