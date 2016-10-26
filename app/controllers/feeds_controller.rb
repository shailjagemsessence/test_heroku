class FeedsController < ApplicationController
  before_action :authenticate_user!
  # autocomplete :user, :email, :full => true

  def index
    @feeds = Feed.by_permission
  end 

  def new
     @feed = Feed.new
     @user = User.new
  end
  
   
  def create
    @feed = current_user.feeds.build(feed_params)
    # binding.pry
    # @feed.pictures.build()
    if @feed.save!
      redirect_to feeds_path
      flash[:notice] = "Successfully submitted details!"
    else
      render :new
    end
  end
    
  # def bookmarks
  #   @feeds = Feed.bookmark_records.paginate(:page => params[:page], :per_page => 10)
  # end

  def profile
    @result  = current_user
    @result1 = current_user.friendships
  end
   
private
  def feed_params
    params.require(:feed).permit(:body, :permission, :user_id,:image, :bookmark, :first_name, :last_name, :dob,:password)
  end
end
    
  