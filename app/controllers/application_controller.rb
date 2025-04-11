class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_profile

  def current_profile
    @current_profile ||= Profile.find_by(user: current_user) if current_user
  end

  def after_sign_in_path_for(resource)
    root_path # This will redirect to home page
  end
end
