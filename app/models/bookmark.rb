class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :feed
  validates_uniqueness_of :feed_id
end
 
