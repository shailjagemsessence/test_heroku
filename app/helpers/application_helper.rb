module ApplicationHelper
  def get_feed_bookmark(feed, user_id)
    bookmark = feed.bookmarks.by_user_id(user_id).first
    bookmark.present? && bookmark.mark_as ? "checked"  : "unchecked" 
  end
end
    

