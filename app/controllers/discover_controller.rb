# define all the methods that define cook discovery
class DiscoverController < ApplicationController
  def index
    @cooks = Cook.where("neighborhood = '#{neighborhood}'")
    @cart_count = customer_cart_count
  end

  private

  def neighborhood
    params[:neighborhood]
  end
end
