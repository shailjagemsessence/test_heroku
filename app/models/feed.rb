class Feed < ApplicationRecord
  belongs_to :user
  enum permission: [:view_all, :me, :friend]
  mount_uploader :image, AvatarUploader
  scope :bookmark_records, -> {where(bookmark: true)}
  scope :by_permission, -> {where(permission: 0).order('updated_at DESC')}
  validates_length_of :body, :minimum => 5, :maximum => 15, :allow_blank => true
end
  
  
  


 