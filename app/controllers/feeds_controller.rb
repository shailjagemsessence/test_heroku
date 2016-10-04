class FeedsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @feeds = current_user.feeds
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
    # binding.pry
    @feed = current_user.feeds.build(feed_params)
    if @feed.save!
      redirect_to feeds_path
    else
      render :new
    end
  end

  def bookmarks
    @feeds = current_user.feeds.all
  end
  
private
  def feed_params
    params.require(:feed).permit(:body, :image, :permission, :user_id, :bookmark)
  end
end
     