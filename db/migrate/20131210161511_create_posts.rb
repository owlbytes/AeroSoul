class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :artist
      t.text :commision 
      t.boolean :flag, default: false
      t.text :description
      t.text :photo
      t.text :city
      t.date :date
      t.text :medium
      t.integer :post_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :date_created
      t.integer :score, default: 0
      t.string :upvoters, default: "0"
      t.string :downvoters, default: "0"
      t.timestamps
    end

    create_table :scores do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer :score
    end

    create_table :stars do |t|
      t.belongs_to :user
      t.belongs_to :post
    end 

  end
end

 