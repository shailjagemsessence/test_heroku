class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :feeds, :dependent => :destroy
  has_many :bookmarks
  has_many :friendships
  has_many :friends, :through => :friendships
  mount_uploader :image, AvatarUploader
  

  def get_user
  friend_ids = self.friendships.map(&:friend_id).uniq
    if friend_ids.blank? 
      User.where.not("id = ?", self.id)
    else
      friend_ids << self.id
      User.where.not("id IN (?) ", friend_ids)
    end
  end
      
  def self.search(search)
    if search
      self.where("email like ?", "%#{search}%")
    else
      self.all
    end
  end
      
  def show_user
    Friendship.joins(:user).where("friend_id = ? AND status = ?", self.id, 'request_send')
  end

  def friend_list
    Friendship.joins(:user).where("friend_id = ? AND status = ?", self.id, 'accept')
  end
       
  def name
    "#{self.first_name} #{self.last_name}"
  end



  def self.from_omniauth(auth)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
    
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end

      
    
      
   
        
      
    


  


  

  


  
  
  
 
  