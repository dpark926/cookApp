class CooksController < ApplicationController
  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    # byebug
    if @cook.valid?
      @cook.save
      redirect_to cook_path(@cook)   #we want to log a cook in as soon as she creates profile
    else
      # render 'new'
      redirect_to new_cook_path
    end
  end

  def show
    get_cook
    get_cook_foods
    get_cook_reviews
    @order = Order.new
    @review = Review.new
  end

  def edit
    get_cook
  end

  def update
    get_cook
    @cook.update(cook_params)
    if @cook.valid?
      redirect_to cook_path
    else
      redirect_to edit_cook_path
    end
  end

  def destroy
    get_cook
    @cook.destroy
    redirect_to root_path
  end

  private

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :city, :neighborhood, :address, :description,:image_url)
  end

  def get_cook
    @cook = Cook.find(params[:id])
  end

  def get_cook_foods
    get_cook
    @foods = @cook.foods
  end

  def get_cook_reviews
    get_cook
    @reviews = @cook.reviews
  end
end
