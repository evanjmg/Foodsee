Instagram.configure do |config|

   config.client_id = ENV['INSTAGRAM_API_KEY']

   config.access_token = ENV['INSTAGRAM_API_SECRET']

   end