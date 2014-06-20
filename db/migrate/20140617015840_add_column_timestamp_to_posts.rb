class AddColumnTimestampToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reply_at, :timestamp 
  end
end
