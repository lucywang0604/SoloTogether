class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :visitor, :local, :update]

  def index
  end

  def show
  end

  def me
    @profile = current_user.profile
  end

  def visitor
    @profile.visitor!
    redirect_to me_path
  end

  def local
    @profile.local!
    redirect_to me_path
  end

  def update
    if @profile.update(profile_params)
      render json: { biography: @profile.biography }
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:biography)
  end
end
