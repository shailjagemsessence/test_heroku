class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :feed
  scope :remove_bookmarks, -> {where(mark_as: true).order('updated_at DESC')}
end
  
 
