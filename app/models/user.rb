class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :confirmable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :feeds
  has_many :bookmarks
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  mount_uploader :image, AvatarUploader
  scope :search_by_email, -> (email) {where("email like ?", "%#{email}%")}
  validates :contact_no,   :presence => {:message => 'invalid phone number!'},
                            :numericality => true,
                            :length => { :minimum => 10, :maximum => 15 }
  validates_format_of :first_name, with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validate :is_valid_dob?

  # private
  # def is_valid_dob?
  #   if((dob.is_a?(Date) rescue ArgumentError) == ArgumentError)
  #     errors.add(:dob, 'Sorry, Invalid Date of Birth Entered.')
  #   end
  # end


  
  def get_user
  friend_ids = self.friendships.map(&:friend_id).uniq
    if friend_ids.blank? 
      User.where.not("id = ?", self.id)
    else
      friend_ids << self.id
      User.where.not("id IN (?) ", friend_ids)
    end
  end
      
  def show_user
    Friendship.joins(:user).where("friend_id = ? AND status = ?", self.id, 'request_send').uniq
  end

  def friend_list
    Friendship.joins(:user).where("status = ?",  'accept')
  end
 

  def follow_list
    follow_list = Friendship.joins(:user).where("user_id = ? AND status = ?", self.id, 'request_send').uniq
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
      # binding.pry
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end

