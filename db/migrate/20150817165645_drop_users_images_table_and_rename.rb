class DropUsersImagesTableAndRename < ActiveRecord::Migration
  def change
    drop_table :images_users
    create_table :imageusers do |t|
      t.references :user
      t.references :image
    end
  end
end
