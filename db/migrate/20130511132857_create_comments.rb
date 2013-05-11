class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :email
      t.references :userRequest

      t.timestamps
    end
    add_index :comments, :userRequest_id
  end
end
