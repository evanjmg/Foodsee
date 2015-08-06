class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurants, only: [:show, :destroy]
  
  def selected
    @images = []
    image_ids = params[:image_ids]
    image_ids.each do |image_id|
      @images << Image.find(image_id)
    end
    restaurants = []
    @images.each do |image|
      restaurants <<  image.restaurant
    end 
    @restaurants = restaurants.uniq
    # a = current.images.all - @restaurants

  end
  def show
    
  end

  def index
    @restaurants = Restaurant.all
  end
 def destroy
   @restaurant.destroy
   respond_to do |format|
     format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
     format.json { head :no_content }
   end
 end
  private 
  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurants_params
    params.require(:restaurant).permit(:name, :latitude,:longitude, :category, :image_ids => [])
  end 

end

