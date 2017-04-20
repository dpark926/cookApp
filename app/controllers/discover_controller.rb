# define all the methods that define cook discovery
class DiscoverController < ApplicationController
  def index
    @cooks = Cook.where("neighborhood = '#{neighborhood}'")
  end

  private

  def neighborhood
    params[:neighborhood]
  end
end
