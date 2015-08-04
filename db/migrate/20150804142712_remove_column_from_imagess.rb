class RemoveColumnFromImagess < ActiveRecord::Migration
  def change
    remove_column :images, :image_collection_id, :string
  end
end
