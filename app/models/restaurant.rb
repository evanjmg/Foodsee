class Restaurant < ActiveRecord::Base
 has_many :images
 validate :latitude, presence: true
 validate :lontitude, presence: true
 validate :name, presence: true
 
end
