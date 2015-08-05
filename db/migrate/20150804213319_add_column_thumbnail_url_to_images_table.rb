class AddColumnThumbnailUrlToImagesTable < ActiveRecord::Migration
  def change
    add_column :images, :thumbnail_url, :string
  end
end
