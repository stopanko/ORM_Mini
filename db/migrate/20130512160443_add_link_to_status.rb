class AddLinkToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :link, :string
    add_index :statuses, :link, :unique => true
  end
end
