class AddColumnCollectionIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :image_collection, index: true, foreign_key: true
  end
end
