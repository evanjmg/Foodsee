class Restaurant < ActiveRecord::Base
 has_many :images
 validates :latitude, presence: true
 validates :longitude, presence: true
 validates :name, presence: true
 
end
