class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.string :code
      t.string :text
      t.string :email
      t.string :name
      t.references :status

      t.timestamps
    end
    add_index :user_requests, :status_id
  end
end
