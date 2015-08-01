class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :images, array: true, default: []
      t.references :image_collection, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :name
      t.double :rating
      t.string :cuisines, array: true, default: []
      t.int :cost
      t.string :address
      t.string :editorReview

      t.timestamps null: false
    end
  end
end
