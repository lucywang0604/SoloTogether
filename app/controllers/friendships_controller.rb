class FriendshipsController < ApplicationController
  def create
    @friendship = current_profile.pending_friendships.build(profile_two_id: params[:profile_id])
    if @friendship.save
      redirect_to profile_path(params[:profile_id]), notice: 'Friend request sent!'
    else
      redirect_to profile_path(params[:profile_id]), alert: 'Unable to send friend request.'
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    if @friendship.update(accepted: true)
      redirect_to me_path, notice: 'Friend request accepted!'
    else
      redirect_to me_path, alert: 'Unable to accept friend request.'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to me_path, notice: 'Friendship removed.'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:profile_id)
  end
end
