class RestaurantsController < ApplicationController
  before_action :set_restaurent, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params_restaurant)
    redirect_to :restaurants_path
  end

  def edit
  end

  def update
    @restaurant.update(params_restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

   private

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurent
    @restaurant = Restaurant.find(params[:id])
  end
end

