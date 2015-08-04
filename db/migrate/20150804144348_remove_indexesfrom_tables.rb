class RemoveIndexesfromTables < ActiveRecord::Migration
  def change
    remove_foreign_key('image_collections', 'users')
    remove_index(:image_collections, ['user_id'])
  end
end
