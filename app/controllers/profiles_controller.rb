class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :visitor, :local]

  def index
  end

  def show

  end

  def visitor
    @profile.visitor!
    redirect_to profile_path(@profile)
  end

  def local
    @profile.local!
    redirect_to profile_path(@profile)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
