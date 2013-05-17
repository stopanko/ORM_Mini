class RemoveCommentIdFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :comment_id
  end

  def down
    add_column :comments, :comment_id, :string
  end
end
