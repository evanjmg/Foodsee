class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.string :tags, array: true, default: []
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
