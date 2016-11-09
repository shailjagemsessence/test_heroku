class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  enum status: {request_send: 'request_send', accept: 'accept' , reject: 'reject'}
  scope :check_firend_request, -> (user_id, friend_id) {where("(user_id = ? AND friend_id = ? AND status = ?  ) OR (user_id = ? AND friend_id = ? AND status = ? ) ",friend_id,user_id,'request_send',user_id,friend_id,'request_send')}
  scope :check_firendlist_request, -> (user_id, friend_id) {where("(user_id = ? AND friend_id = ? AND status = ?  ) OR (user_id = ? AND friend_id = ? AND status = ? ) ",friend_id,user_id,'accept',user_id,friend_id,'accept')}
end
  

  
    
    

  
  
  


