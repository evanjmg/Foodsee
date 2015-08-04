class RemoveImagefromImageCollections < ActiveRecord::Migration
  def change
    remove_column :image_collections, :images, :string, array: true
  end
end
