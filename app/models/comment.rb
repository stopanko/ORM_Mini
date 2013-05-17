class Comment < ActiveRecord::Base
  belongs_to :userRequest
  attr_accessible :email, :text, :name, :userRequest_id
end
