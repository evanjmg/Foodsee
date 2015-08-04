class RemoveEditorReviewfromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :editorReview, :string 
  end
end
