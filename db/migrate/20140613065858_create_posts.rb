class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :user_id
      t.string :types
      t.string :content
      
      t.timestamps
    end
  end
end
