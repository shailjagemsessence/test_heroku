class FeedsController < ApplicationController

  def index

  end 


  
  def new
    # binding.pry
    @feed = Feed.new
  end

  def show
    # binding.pry
    @feed = current_user.feeds.find(params[:id])
  end


  def create
    @feed = current_user.feeds.build(feed_params)
    if @feed.save!
      redirect_to @feed
    else
      render :new
    end
  end

  def bookmarks
    @feeds = current_user.feeds
  end

private
  def feed_params
    params.require(:feed).permit(:body, :image, :permission, :user_id)
  end
    
end
    
  
  


    
  




  



  




