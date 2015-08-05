class ChangeColumnFacebookAndInstagramIdToText < ActiveRecord::Migration
  def change
    remove_column :restaurants, :facebook_id, :string
    remove_column :restaurants, :instagram_id, :string
    add_column :restaurants, :facebook, :text
    add_column :restaurants, :instagram, :text
  end
end
