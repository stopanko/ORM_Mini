class AddThemeToUserRequest < ActiveRecord::Migration
  def change
    add_column :user_requests, :theme, :string
  end
end
