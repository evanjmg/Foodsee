class AddColumnFacebookIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :facebook_id, :integer
  end
end
