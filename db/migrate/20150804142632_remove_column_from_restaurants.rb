class RemoveColumnFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :image_collection_id, :string
  end
end
