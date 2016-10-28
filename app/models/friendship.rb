class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  enum status: {request_send: 'request_send', accept: 'accept' , reject: 'reject'}
end
  

