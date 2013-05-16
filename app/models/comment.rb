class Comment < ActiveRecord::Base
  belongs_to :userRequest
  attr_accessible :email, :text, :comment_id, :name, :userRequest_id
end
