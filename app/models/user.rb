class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :feeds
  has_many :friendships
  # has_many :friends, class_name: "User", foreign_key: 'friend_id'
  # belongs_to :user, class_name: "User"
  has_many :friends, :through => :friendships

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
  
  
  
  

  
  
  
 
  