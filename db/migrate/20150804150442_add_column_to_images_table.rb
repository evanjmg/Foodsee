class AddColumnToImagesTable < ActiveRecord::Migration
  def change
    add_column :images, :restaurant_id, :integer
  end
end
