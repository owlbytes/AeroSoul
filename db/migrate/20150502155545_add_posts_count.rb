class AddPostsCount < ActiveRecord::Migration

  def self.up
    add_column :users, :posts_count, :integer, :default => 0

    User.reset_column_information
    User.find(:all).each do |p|
      User.update_counters p.id, :posts_count => p.posts.length
    end
  end  

  def self.down
    remove_column :users, :posts_count
  end

end
