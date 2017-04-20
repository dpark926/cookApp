class ReviewsController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    get_customer
    @review = Review.new(review_params)
    if @review.valid?
      # byebug
      @review.save
      redirect_to cook_path(@review.cook_id)
    else
      redirect_to root_path
    end
  end

  def show
    get_review
  end

  def edit
    get_review
  end

  def update
    get_review
    @review.update(review_params)
    if @review.valid?
      redirect_to review_path
    else
      redirect_to edit_review_path
    end
  end

  def destroy
    get_review
    get_customer
    @review.destroy
    redirect_to customer_path(@customer)
  end

  private

  def review_params
    params.require(:review).permit(:content, :customer_id, :cook_id, :rating)
  end

  def get_review
    @review = Review.find(params[:id])
  end

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end
end
