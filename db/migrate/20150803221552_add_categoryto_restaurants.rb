class AddCategorytoRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :category, :string, array: true
  end
end
