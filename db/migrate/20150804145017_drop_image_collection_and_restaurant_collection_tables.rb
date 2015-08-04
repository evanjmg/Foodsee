class DropImageCollectionAndRestaurantCollectionTables < ActiveRecord::Migration
  def change
    drop_table :image_collections
    drop_table :restaurant_collections
  end
end
