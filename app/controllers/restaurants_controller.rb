class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurants, only: [:show, :destroy, :my_restaurants]
  def my_restaurants

    restaurants = []
    current_user.images.each do |image|
      restaurants << image.restaurant
    end
    @restaurants = restaurants.uniq
  end
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
  
    Restaurant.all.each do |restaurant|
      rest_user_exist = false
      if restaurant.images.nil? 
        restaurant.destroy
      else
        restaurant.images.each do |image|
          puts image.users
          if !(image.users.empty?)
            rest_user_exist = true 
            puts "in function" + rest_user_exist.to_s
           break; 
         end
       end
     end
     puts "out function" + rest_user_exist.to_s
     if !rest_user_exist
      restaurant.images.each do |image|
        image.destroy
      end
       restaurant.destroy 
       puts "destroyed"
     end
   end
    # other way: Restaurant.where([
    #    image_id NOT IN (?)",
    #   Image.pluck("id"),
    #   User.pluck("id")
    # ]).destroy_all

@restaurants = restaurants.uniq
end
def show

end

def index
  @restaurants = Restaurant.all
end
def destroy
 @restaurant.destroy
 respond_to do |format|
   format.html { redirect_to my_restaurants_path, notice: 'Workout was successfully destroyed.' }
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

