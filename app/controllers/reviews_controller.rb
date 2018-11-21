class ReviewsController < ApplicationController

before_action :set_restaurants

  def index
    @reviews = Review.where(restaurant_id: params[:restaurant_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    @review.save
    if @review.save
    redirect_to restaurant_path(@restaurant)
  else
     redirect_to new_restaurant_review_path(@restaurant, @review)
  end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_reviews_path
  end
  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end


  def set_restaurants
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
