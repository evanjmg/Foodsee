class RemoveImagesFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :images, :string
  end
end
