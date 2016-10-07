class FeedsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @feeds = Feed.by_permission
  end 
  
  def new
    # binding.pry
    @feed = Feed.new
  end

  

  def create
       # binding.pry
    @feed = current_user.feeds.build(feed_params)
    if @feed.save!
      redirect_to feeds_path
      flash[:notice] = "Successfully submitted details!"
    else
      render :new
    end
  end
  def bookmarks
    @feeds = Feed.bookmark_records.paginate(:page => params[:page], :per_page => 10)
  end

  def profile

    @feed = current_user.first_name
  end


    
  def bookmark_the_feed
    @feed = Feed.find(params[:id])
    @feed.update_attributes(bookmark: params[:bookmark])
    respond_to do |format|
      format.html { redirect_to feeds_url }
    end
  end
   
private
  def feed_params
    params.require(:feed).permit(:body, :image, :permission, :user_id, :bookmark, :first_name, :last_name, :dob,:password)
  end
end
     

    


      
    
      
    
    
    

  



     