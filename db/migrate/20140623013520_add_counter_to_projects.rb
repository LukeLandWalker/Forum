class AddCounterToProjects < ActiveRecord::Migration
  def self.up
    add_column :posts, :replies_count, :integer, :default => 0

    Post.reset_column_information
    Post.all.each do |p|
      Post.update_counters p.id, :replies_count => p.replies.length
    end
  end

  def self.down
    remove_column :posts, :replies_count
  end
end
