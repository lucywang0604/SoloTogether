class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  before_action :set_friend_request, only: [:update, :destroy]

  def create
    @friend_request = current_user.profile.sent_friend_requests.build(receiver: @profile)

    if @friend_request.save
      redirect_to profile_path(@profile), notice: 'Friend request sent!'
    else
      redirect_to profile_path(@profile), alert: 'Unable to send friend request.'
    end
  end

  def update
    if @friend_request.accepted!
      # Create the friendship
      Friendship.create(
        profile: @friend_request.sender,
        friend: @friend_request.receiver
      )
      # Delete the friend request after creating the friendship
      @friend_request.destroy

      redirect_to me_path, notice: 'Friend request accepted!'
    else
      redirect_to me_path, alert: 'Could not accept friend request.'
    end
  end

  def destroy
    @friend_request.destroy
    redirect_back(fallback_location: me_path, notice: 'Friend request removed.')
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
