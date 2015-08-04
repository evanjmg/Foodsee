class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  
  def tagged
    if params[:tag].present? 
      @images = Image.tagged_with(params[:tag])
    else 
      @images = Image.postall
    end  
  end

  def index
    @images = Image.all
  end
  def new
    @image = Image.new
  end
  def show
  end

  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
  def image_params
      params.require(:image).permit(:url, :tag_list, :image_file, :remote_image_file_url) ## Rails 4 strong params usage
    end
end

# TAGS
# Add and remove a single tag

# @user.tag_list.add("awesome")   # add a single tag. alias for <<
# @user.tag_list.remove("awesome", "multiple") # remove a single tag
# OR @user.tag_list.remove("awesome, slick", parse: true)
# You can also add and remove tags by direct assignment. Note this will remove existing tags so use it with attention.

# @user.tag_list = "awesome, slick, hefty"
# @user.save
# @user.reload
# @user.tags
# => [#<ActsAsTaggableOn::Tag id: 1, name: "awesome", taggings_count: 1>,
#  #<ActsAsTaggableOn::Tag id: 2, name: "slick", taggings_count: 1>,
#  # <ActsAsTaggableOn::Tag id: 3, name: "hefty", taggings_count: 1>]
#  MOST USED ActsAsTaggableOn::Tag.most_used ActsAsTaggableOn::Tag.least_used
# ActsAsTaggableOn::Tag.most_used(10)
# ActsAsTaggableOn::Tag.least_used(10) - limits