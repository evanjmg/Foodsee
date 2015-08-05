class SearchController < ApplicationController
 before_action :authenticate_user!
 def new
 end
 def index
  # Get Facebook data through query
  response = facebook_restaurant_search(params[:search_query], params[:lat], params[:lon], 3000)
  data = response['data']
  temp_restaurants = []

  # Create restaurants from Facebook Places data
  data.each do |restaurant|
    categories = []
    lat  = restaurant['location']['longitude']
    long = restaurant['location']['latitude']
    name = restaurant['name']
    facebook_id = restaurant['id'].to_s
    restaurant['category_list'].each do |category|
      categories << category['name']
    end
    temp_restaurants << Restaurant.create(latitude: lat, longitude: long, name: name, category: categories, facebook: facebook_id)
  end

# Pull location and send to Instagram to Get and Create Images

@images = []
 temp_restaurants[0..1].each do |restaurant|

  instagram_place = instagram_client.location_search(restaurant.longitude, restaurant.latitude)

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

end

end
