class RemoveTagsfromImages < ActiveRecord::Migration
  def change
    remove_column :images, :tags, :string
  end
end
