class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  enum status: {request_send: 'request_send', accept: 'accept' , reject: 'reject'}
  scope :check_firend_request, -> (user_id, friend_id) {where("(user_id = ? AND friend_id = ?) or (user_id = ? AND friend_id = ?)", user_id, friend_id, friend_id, user)}
end
  
  

