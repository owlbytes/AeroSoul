class AddTimestampsToStars < ActiveRecord::Migration
  def change
    change_table :stars do |t|
      t.timestamps 
    end
  end
end
