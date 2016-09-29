class FeedsController < ApplicationController

  def index

  end 


  
  def new
    # binding.pry
    @feed = Feed.new
  end

  def show

  end

  def create
    # binding.pry
    @feed = current_user.feeds.build(feed_params)
    if @feed.save!
      
      redirect_to @feed
    
    else
      render :new
    end
  end

private
  def feed_params
    params.require(:feed).permit(:body, :image, :permission, :user_id)
  end
    
end
    
  
  


    
  




  



  




