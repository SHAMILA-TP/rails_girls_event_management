# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string, null: false, default: "", if_not_exists: true
    add_column :users, :encrypted_password, :string, null: false, default: "", if_not_exists: true

    add_index :users, :email, unique: true, if_not_exists: true
  end
end
