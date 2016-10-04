class Feed < ApplicationRecord
  belongs_to :user
  enum permission: [ :view_all, :me, :friend]
  mount_uploader :image, AvatarUploader
  
end


 