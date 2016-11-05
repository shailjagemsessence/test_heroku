class BookmarksController < ApplicationController

  def index
    # binding.pry
    @bookmarks = current_user.bookmarks.paginate(:page => params[:page], :per_page => 10)
  end
  
  def create
    # binding.pry
    @bookmark = current_user.bookmarks.build(feed_id: params[:feed_id], mark_as: params[:mark_as])
    if @bookmark.save
      render nothing: true
    end  
  end

  def destroy
    # binding.pry
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
    

       