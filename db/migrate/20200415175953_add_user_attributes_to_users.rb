class AddUserAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :user_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_buyer, :boolean, default: false
    add_column :users, :is_seller, :boolean, default: false
  end
end
