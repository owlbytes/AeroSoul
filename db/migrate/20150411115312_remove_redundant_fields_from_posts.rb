class RemoveRedundantFieldsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :artist
    remove_column :posts, :commision
    remove_column :posts, :medium
  end

end
