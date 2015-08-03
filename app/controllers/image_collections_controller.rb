class ImageCollectionsController < ApplicationController
  def new
    response = facebook_restaurant_search(params[:search_query], params[:lat], params[:lon], 3000)
    data = response['data']
    lat_array = []
    long_array = []
    data.each_with_index do |restaurant, index| 
      lat_array << restaurant['location']['latitude']
      long_array << restaurant['location']['longitude']
     end
     @image_urls = []
      
      a = instagram_client.location_search(lat_array[0], long_array[0])


    for media_item in instagram_client.location_recent_media(a[0].id)
       @image_urls << media_item.images.thumbnail.url
     end
    # id_array.each do |id|
    # locations << instagram_client.location_search(id)
    #   end
  end

  def index
  end

  def create
  end

  def destroy
  end
end
# 
# @image_urls = []
# locations.each do |location|
# for media_item in instagram_client.location_recent_media(location.id)

#    @image_urls << media_item.images.thumbnail.url
#  end    # @search_collection = current_user.image_collections.create() 
    # instagram_client.tag_recent_media(@tags[0].name).each do |media_item| 
    #  @search_collection >> Image.create()