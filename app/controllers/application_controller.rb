class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    # t.string :first_name
    #   t.string :last_name
    #   t.string :public_profile_url
    #   t.string :bootcamp
    #   t.integer :organization_id
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :last_name) }
  end
end
