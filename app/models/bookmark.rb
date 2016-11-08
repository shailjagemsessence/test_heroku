class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :feed
  validates_uniqueness_of :user_id, scope: :feed_id
  scope :remove_bookmarks, -> {where(mark_as: true).order('updated_at DESC')}
  scope :show_bookmark_true_value, -> {where(mark_as: true).order('updated_at DESC')}
  scope :by_user_id, -> (user_id) {where(user_id: user_id)}
end
  
  
 
