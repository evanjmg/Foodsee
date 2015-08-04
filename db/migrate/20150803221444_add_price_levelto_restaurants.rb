class AddPriceLeveltoRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :price_level, :integer
  end
end
