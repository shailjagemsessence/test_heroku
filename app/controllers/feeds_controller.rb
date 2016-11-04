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
  end
    
  def send_request_mail
    # binding.pry
    @sender = current_user
    @receiver = User.search_by_email(params[:email]).first if params[:email].present?
    if @receiver.present?
      @friendship = @sender.friendships.build(friend_id: @receiver.id, status: 'request_send')
      if @friendship.save
        ApplicationMailer.send_email_for_friend_request( @sender, @receiver).deliver 
        flash.now[:success] = "mail_sent"
        redirect_to :back
      end
    else
      flash[:notice] = "unvalid email!" 
    end
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

  
  


   


    
  