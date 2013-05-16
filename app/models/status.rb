class Status < ActiveRecord::Base
  has_many :user_requests
  attr_accessible :name, :link
end
