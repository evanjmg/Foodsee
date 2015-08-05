class RemoveLatAndLongFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :latitude, :float
    remove_column :images, :longitude, :float
  end
end
