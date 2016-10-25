class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  # scope :bookmark_records, -> {where(bookmark: true).order('updated_at DESC')}
end
