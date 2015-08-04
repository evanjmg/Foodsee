CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWS_API_KEY'],  # required
    :aws_secret_access_key  => ENV['AWS_API_SECRET'],  # required
    :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'foodsee'  # required
  config.fog_public  = true  # optional, defaults to true
end