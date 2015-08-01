class CreateImageCollections < ActiveRecord::Migration
  def change
    create_table :image_collections do |t|
      t.string :images, array: true, default: []
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
