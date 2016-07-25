class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :instagram, :string
    add_column :users, :twitter, :string
  end
end
