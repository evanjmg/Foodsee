class RemoveCuisinesFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :cuisines, :string
  end
end
