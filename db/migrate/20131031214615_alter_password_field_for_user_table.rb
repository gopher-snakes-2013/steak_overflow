class AlterPasswordFieldForUserTable < ActiveRecord::Migration 
  def change
    remove_column :users, :password
    add_column :users, :password_hash, :string
  end
end
