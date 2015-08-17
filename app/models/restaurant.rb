class Restaurant < ActiveRecord::Base
 has_many :images, dependent: :destroy
 validates :latitude, presence: true
 validates :longitude, presence: true
 validates :name, presence: true
 reverse_geocoded_by :latitude, :longitude
 after_validation :reverse_geocode  # auto-fetch address
end
