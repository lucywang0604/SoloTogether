class PagesController < ApplicationController
  def home
    @experiences = Experience.joins(:city).near(current_user.profile.current_city.name, 100)
    # @profiles = Profile
    #             .joins(:current_city)
    #             .near(current_user.profile.current_city.name, 100)
    #             .where.not(id: current_user.profile.id)
    #             .where(mode: "local")

    @profiles = Profile.all.where.not(id: current_user.profile.id)
  end
end
