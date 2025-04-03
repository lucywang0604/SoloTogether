class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :visitor, :local]

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

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
