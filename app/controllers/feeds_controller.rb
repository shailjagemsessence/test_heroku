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
    @user = current_user
    @friendships = current_user.show_user
    @friendlist = current_user.friend_list
    @user_email = User.search(params[:search])
  end
  
   

  def update
  @feed = Feed.find(params[:id])
  if @feed.update_attributes(feed_params)
    flash[:success] = "feed updated"
      redirect_to @feed
    else
      render 'edit'
    end
  end

  def edit
  end
    
   
private
  def feed_params
    params.require(:feed).permit(:body, :permission, :user_id,:image, :bookmark, :first_name, :last_name, :dob,:password,:status)
  end
end

    
  