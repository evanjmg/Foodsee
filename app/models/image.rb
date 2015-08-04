class Image < ActiveRecord::Base
  belongs_to :image_collection
  acts_as_taggable_on :tags
  mount_uploader :image_file, ImageFileUploader
end
