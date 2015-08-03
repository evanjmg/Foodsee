class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :instagram_client
  helper_method :facebook_restaurant_search
 
  def facebook_restaurant_search(search_query,lat,long,distance)
   puts url = URI.escape("https://graph.facebook.com/v2.4/search?q=#{search_query}&type=place&center=#{lat},#{long}&distance=#{distance}&access_token=#{ENV['FACEBOOK_API_KEY']}|#{ENV['FACEBOOK_API_SECRET']}")
      HTTParty.get(url)
  end
  

  def instagram_client
    Instagram.client(:access_token => current_user.identities.find_by(provider: 'instagram').access_token)
  end

  def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      return if action_name == 'finish_signup'

      # Redirect to the 'finish_signup' page if the user
      # email hasn't been verified yet
      if current_user && !current_user.email_verified?
        redirect_to finish_signup_path(current_user)
      end
    end
end
