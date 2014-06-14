class RemovePasswordToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password, :password_confirmation
  end
end
