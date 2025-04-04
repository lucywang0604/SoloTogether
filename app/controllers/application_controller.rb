class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_profile

  def current_profile
    @current_profile ||= Profile.find_by(user: current_user) if current_user
  end

  def after_sign_in_path_for(resource)
    root_path # This will redirect to home page
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
  end
end
