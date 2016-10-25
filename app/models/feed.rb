class Feed < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  mount_uploader :image, AvatarUploader
  enum permission: [:view_all, :me, :friend]
  scope :bookmark_records, -> {where(bookmark: true).order('updated_at DESC')}
  scope :by_permission, -> {where(permission: 0).order('updated_at DESC')}
  validates_length_of :body, :minimum => 5, :maximum => 15, :allow_blank => true
end
  

  
  
  
  


 