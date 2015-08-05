class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [:show]

  def selected
    restaurants = []
    current_user.images.each do |image|
      restaurants <<  image.restaurant
    end 
    @restaurants = restaurants.uniq

  end
  def show
    
  end

  def index
    @restaurants = Restaurant.all
  end

  private 
  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurants_params
    params.require(:restaurant).permit(:name, :latitude,:longitude, :category, :image_ids => [])
  end 

end

