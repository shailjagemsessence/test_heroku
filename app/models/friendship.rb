class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  # validates_uniqueness_of :friend_id
  enum status: {request_send: 'request_send', accept: 'accept' , reject: 'reject'}
end
  

