class PagesController < ApplicationController
  def home
    @experiences = Experience.joins(:city).near(current_user.profile.current_city.name, 10)
    @profiles = Profile
                .joins(:current_city)
                .near(current_user.profile.current_city.name, 10)
                .where.not(id: current_user.profile.id)

    @posts = Post.includes(:profile).order(created_at: :desc)
  end
end
