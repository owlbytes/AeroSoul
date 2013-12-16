class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :photo
      t.string :role
      t.string :fav_posts, :default => "[]"
      t.integer :score

    end
  end

  
end

