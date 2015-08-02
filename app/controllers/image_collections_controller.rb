class ImageCollectionsController < ApplicationController
  def new
    @tags = instagram_client.tag_search((params[:query]))

    @search_collection = current_user.image_collections.create() 
    instagram_client.tag_recent_media(@tags[0].name).each do |media_item| 
     @search_collection >> Image.create()
  end

  def index
  end

  def create
  end

  def destroy
  end
end
