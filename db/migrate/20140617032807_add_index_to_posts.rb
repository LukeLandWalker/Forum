class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, [:user_id, :reply_at]
  end
end
