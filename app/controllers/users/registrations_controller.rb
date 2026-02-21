class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:create]

  protected

  # Override Devise's after_sign_up_path_for for new signups
  def after_sign_up_path_for(resource)
    new_profile_path
  end

  # Override Devise's after_sign_in_path_for for logins
  def after_sign_in_path_for(resource)
    profiles_path
  end
end
