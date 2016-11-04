class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
    @user = User.new
  end

  def index
    @users = current_user.get_user
  end

  def update
    @friendship = Friendship.find(params[:id])
    if @friendship.update(status: params[:status])
      flash[:success] = " updated"
      redirect_to :back
    else
      render 'new'
    end
  end
      
  

  def destroy
     @friendship = Friendship.find(params[:id])
     @friendship.destroy
     redirect_to :back
  end
    
    
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], status: params[:status])
    if @friendship.save
      flash[:notice] = "friend added"
    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to :back
  end
end
      
    
    
      
  
  


  

  

  
    


    
  



    

