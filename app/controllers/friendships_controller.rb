class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
    @user = User.new
  end

  def index
    # @users = User.all
    @users = current_user.get_user
  end

  def update
    # binding.pry
    @friendship = Friendship.find(params[:id])
    if @friendship.update(status: params[:status])
      flash[:success] = " updated"
      redirect_to :back
    else
      render 'edit'
    end
  end
      
  def edit
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
      
    
    
      
  
  


  

  

  
    


    
  



    

