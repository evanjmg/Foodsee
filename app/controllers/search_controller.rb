class SearchController < ApplicationController
 before_action :authenticate_user!
 after_filter "save_my_previous_url", only: [:new]
 def new
  if !Image.all.empty?
    @images = Image.all
    restaurants = []
    @images.each do |image| 
      restaurants << image.restaurant
    end
    @restaurants = restaurants.uniq
  end
end


  def recent 

  end
  def index
    lat = params[:lat]
    lon = params[:lon]
   # Geocode location query if present
  if params[:location] != ""
   coordinates = Geocoder.coordinates(params[:location])
   lat = coordinates[0]
   lon = coordinates[1]
  end
  # Get Facebook data through query
  if !(lat.blank? && lon.blank?)
  response = facebook_restaurant_search(params[:search_query],lat,lon , 3000)
  data = response['data']
  temp_restaurants = []
  # Create restaurants from Facebook Places data
  data.each do |restaurant|
    categories = []
    lat = restaurant['location']['latitude']
    long  = restaurant['location']['longitude']
    name = restaurant['name']
    facebook_id = restaurant['id'].to_s
    restaurant['category_list'].each do |category|
      categories << category['name']
    end
    temp_restaurants << Restaurant.create(latitude: lat, longitude: long, name: name, category: categories, facebook: facebook_id)
  end

# Pull location and send to Instagram to Get and Create Images

@images = []
if temp_restaurants != nil
  temp_restaurants.each do |restaurant|
binding.pry
    instagram_place = instagram_client.location_search(restaurant.latitude, restaurant.longitude)

    restaurant.instagram = instagram_place[0].id.to_s 

    for media_item in instagram_client.location_recent_media(restaurant.instagram)

      if media_item != nil
        image = Image.new(url: media_item.images.standard_resolution.url, thumbnail_url: media_item.images.thumbnail.url)
        image.tag_list = media_item.tags.to_s
        image.save
        restaurant.images << image
        @images << image
      end
    end
    restaurant.save
  end

else 
  render :new, notice: "No results. Please try again."
end
else 
  redirect_to new_search_path, alert: "Please make sure location services is on. You may provide your location below. "
end

end

def save_my_previous_url
   # session[:previous_url] is a Rails built-in variable to save last url.
   session[:my_previous_url] = URI(request.referer || '').path

 end
end
