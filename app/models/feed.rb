class Feed < ApplicationRecord
  belongs_to :user
  enum permission: [:view_all, :me, :friend]
  mount_uploader :image, AvatarUploader
  scope :bookmark_records, -> {where(bookmark: true)}
  scope :by_permission, -> {where(permission: 0)}
end
  


 