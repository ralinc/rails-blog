class AddDeviseToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :encrypted_password, :string, null: false
    remove_column :users, :name
    remove_column :users, :password_digest
  end
end
