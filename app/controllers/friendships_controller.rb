class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
    @user = User.new
  end

  def index
    current_user.get_user
    @users = User.all
  end
    
    
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "friend added"
      
    else
      flash[:notice] = "Unable to add friend."
      
    end
    redirect_to :back
  end
end
  
  

  

  

  
    


    
  



    

