class Image < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :users
  has_many :imageusers, dependent: :destroy
  has_many :users, through: :imageusers
  acts_as_taggable_on :tags
  mount_uploader :image_file, ImageFileUploader
end
