class CreateJoinTableBetweenUsersAndImages < ActiveRecord::Migration
  def change
    create_join_table :users, :images
  end
end
