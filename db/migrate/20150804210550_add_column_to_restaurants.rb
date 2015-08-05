class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :instagram_id, :integer
  end
end
