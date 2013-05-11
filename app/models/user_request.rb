class UserRequest < ActiveRecord::Base
  belongs_to :status
  attr_accessible :code, :email, :name, :text
end
