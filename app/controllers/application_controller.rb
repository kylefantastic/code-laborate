class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :last_name, :public_profile_url, :bootcamp, :org_affiliate) }
  end

  def after_sign_up_path_for(resource)
    new_organization_path(current_user)
  end
end
