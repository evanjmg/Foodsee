class AddSearchesColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :searches, :string, array: true
    add_column :users, :searches_restaurant_id, :string, array:true
  end
end
