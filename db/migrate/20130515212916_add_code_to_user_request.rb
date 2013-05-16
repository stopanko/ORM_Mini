class AddCodeToUserRequest < ActiveRecord::Migration
  def change
    add_column :user_requests, :code, :string
    add_index :user_requests, :code, :unique => true
  end
end
