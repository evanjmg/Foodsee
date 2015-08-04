class RemoveCostfromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :cost, :integer
  end
end
