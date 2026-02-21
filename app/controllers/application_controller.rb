class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception

  # Permit extra fields for Devise if needed
  before_action :configure_permitted_parameters, if: :devise_controller?

    # Devise: after login redirect
  def after_sign_in_path_for(resource)
    profiles_path  # This points to ProfilesController#index
  end

  # Devise: after signup redirect
  def after_sign_up_path_for(resource)
    new_profile_path  # This points to ProfilesController#new
  end


  protected

  def configure_permitted_parameters
    # Add extra permitted fields for sign up / account update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
