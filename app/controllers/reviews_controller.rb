class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    new_review = Review.new(review_params)
    new_review.restaurant = @restaurant
    new_review.save
    # redirect_to restaurant_path(new_review.restaurant_id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :ratings)
  end
end
