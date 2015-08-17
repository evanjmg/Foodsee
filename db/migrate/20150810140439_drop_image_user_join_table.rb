class DropImageUserJoinTable < ActiveRecord::Migration
  def change
    drop_table :images_users
  end
end
