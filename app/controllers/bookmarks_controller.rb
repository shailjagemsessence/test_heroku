class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks.all
  end

  def create
    @bookmark = current_user.bookmarks.build(feed_id: params[:feed_id], mark_as: params[:mark_as])
    if @bookmark.save
      render nothing: true
    end  
  end
end
  

  
    
  
      