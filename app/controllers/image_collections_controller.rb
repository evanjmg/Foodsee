class ImageCollectionsController < ApplicationController
  def new
    
    # @tags = instagram_client.tag_search((params[:query]))
    client = Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_API_KEY'], :client_secret =>  ENV['FOURSQUARE_API_SECRET']))

   
    venues = foursquare.venues.search(:ll => "51.521036, -0.070496")
raise
# , :categoryId => '4d4b7105d754a06374d81259',:query => params[:search_query]
    # locations = instagram_client.location_search("37.7808851", "-122.3948632")
    # @image_urls = []
    # locations.each do |location|
    # for media_item in instagram_client.location_recent_media(location.id)

    #    @image_urls << media_item.images.thumbnail.url
    #  end
   end
    # @search_collection = current_user.image_collections.create() 
    # instagram_client.tag_recent_media(@tags[0].name).each do |media_item| 
    #  @search_collection >> Image.create()

  def index
  end

  def create
  end

  def destroy
  end
end
