class BookmarksController < ApplicationController

  def index
    # binding.pry
    @bookmarks = current_user.bookmarks.show_bookmark_true_value.paginate(:page => params[:page], :per_page => 10)
  end
  
  def create
    # binding.pry
    # if !current_user.bookmarks.active(params[:feed_id]).present?
    # unless current_user.bookmarks.present? and Bookmark.active(params[:feed_id]).present?

      # render nothing: true
    # else
      @bookmark = current_user.bookmarks.build(feed_id: params[:feed_id], mark_as: params[:mark_as])
      if @bookmark.save
        render nothing: true
      end 
    # end
     
  end

  def edit
    binding.pry
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
    

       