class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :artist
      t.boolean :commision 
      t.text :description
      t.text :photo
      t.text :city
      t.date :da
      t.text :medium
      t.integer :post_id
      t.float :latitude
      t.float :longitude
      t.date :date_created
      t.timestamps
    end
  end
end
