class UserRequest < ActiveRecord::Base
  belongs_to :status
  has_many :comments
  attr_accessible :email, :name, :text, :code, :theme
end
