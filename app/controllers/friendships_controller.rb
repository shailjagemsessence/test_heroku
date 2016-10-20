class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "friend added"
      redirect_to profile_feeds_path
    else
      flash[:notice] = "Unable to add friend."
      redirect_to profile_feeds_path
    end
  end
end
    
  



    

