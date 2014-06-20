class ChangeColumnNameOfCountToPosts < ActiveRecord::Migration
  def change
  rename_column :posts, :count, :view_count
  end
end
