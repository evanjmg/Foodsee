class Image < ActiveRecord::Base
  belongs_to :restaurant
  has_and_belongs_to_many :users
  acts_as_taggable_on :tags
  mount_uploader :image_file, ImageFileUploader
end
