class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup, :my_restaurants, :my_photos]
  def my_restaurants

    restaurants = []
    current_user.images.each do |image|
      restaurants << image.restaurant
    end
    @restaurants = restaurants.uniq

  end
  def index
    @users = User.all
  end
  
  def show
    @user  = User.find(params[:id])
  end
  def my_photos
     @images = current_user.images.uniq 
  end
  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end
  def add_search_images_to_user
    @images = []
    image_ids = params["/search"]["image_ids"].reject(&:empty?)
    image_ids.each do |image_id|
      @images << Image.find_by(id: image_id)
      current_user.images << @images
    end
      redirect_to selected_restaurants_path(:image_ids => @images), notice: "Here are the restaurants and their images."
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to root_url, notice: 'You successfully signed up with Instagram.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to new_search_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user

      
      if params[:id] == nil
        @user = current_user
      else 
        @user = User.find(params[:id])
      end
    end

    def user_params
      accessible = [ :name, :email, :username] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible,:image_ids => [] )
    end
end
