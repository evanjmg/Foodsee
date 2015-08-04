class ImageCollectionsController < ApplicationController
  def new
    response = facebook_restaurant_search(params[:search_query], params[:lat], params[:lon], 3000)
    data = response['data']
    lat_array = []
    long_array = []
    data.each_with_index do |restaurant, index| 
      lat_array << restaurant['location']['latitude']
      long_array << restaurant['location']['longitude']
      long_array << restaurant['location']['longitude']
     end
     @image_urls = []

      a = instagram_client.location_search(lat_array[0], long_array[0])

    b = instagram_client.location_search(lat_array[1], long_array[1])
    for media_item in instagram_client.location_recent_media(a[0].id)
       @image_urls << media_item.images.thumbnail.url
     end
     for media_item in instagram_client.location_recent_media(b[0].id)
        @image_urls << media_item.images.thumbnail.url
      end
     @image_urls << "http://cdn.bulbagarden.net/upload/thumb/3/39/007Squirtle.png/250px-007Squirtle.png"
  
     baseurl = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
     lat = params[:lat] #lat_array[0].to_s
     lng =  params[:lon] #long_array[0].to_s
     radius = 2000.to_s
     type = "food"
     sensor = "true"
     keyword = URI.encode((params[:search_query]).tr(' ', '').tr('&','+'))

     combine = baseurl + 'query=' + keyword + '&radius=2000&'+ 'location=' + lat + ',' + lng + "&key=#{ENV['GOOGLE_API_KEY']}"
    yo = HTTParty.get(combine)
    # yo.each_with_index do |restaurant, index| 
    #   lat_array << restaurant['location']['latitude']
    #   long_array << restaurant['location']['longitude']
    #   long_array << restaurant['location']['longitude']
    
   # "https://maps.googleapis.com/maps/api/place/textsearch/json?location=51.5182381,-0.071489&types=food&&query=Cake&key=AIzaSyBDi2YRxYVR2u1QNUdRPhk0-5G3jt3EdFQ"
   # https://maps.googleapis.com/maps/api/place/textsearch/output?parameters
   # https://maps.googleapis.com/maps/api/place/textsearch/json?location=51.5182381,-0.071489&types=food&&query=Cake&rankby=distance&key=AIzaSyBDi2YRxYVR2u1QNUdRPhk0-5G3jt3EdFQ
   # raise

      lat = yo['results'][0]['geometry']['location']['lat']
      lng = yo['results'][0]['geometry']['location']['lng']

      b = instagram_client.location_search(lat, lng)


      lat = yo['results'][1]['geometry']['location']['lat']
      lng = yo['results'][1]['geometry']['location']['lng']

      c = instagram_client.location_search(lat, lng)
     for media_item in instagram_client.location_recent_media(b[0].id)
             @image_urls << media_item.images.thumbnail.url
           end
     for media_item in instagram_client.location_recent_media(c[0].id)
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