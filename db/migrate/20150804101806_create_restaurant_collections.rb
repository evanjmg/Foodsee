class CreateRestaurantCollections < ActiveRecord::Migration
  def change
    create_table :restaurant_collections do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
