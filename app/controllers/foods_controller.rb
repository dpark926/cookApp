class FoodsController < ApplicationController
  def new
    @cook = Cook.find(params[:cook_id])
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.valid?
      @food.save
      redirect_to cook_path
    else
      # render 'new'  <<-- not working
      # redirect_to create_food_path(params[:id])
    end
  end

  def show
    get_food
  end

  def edit
    get_food
  end

  def update
    get_food
    @food.update(food_params)
    if @food.valid?
      redirect_to food_path
    else
      redirect_to edit_food_path
    end
  end

  def destroy
    get_food
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:title, :cuisine, :price, :description, :cook_id, :url, :availability)
  end

  def get_food
    @food = Food.find(params[:id])
  end
end
