# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # Override Devise's after_sign_in_path_for for signups
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      # This is the first time they sign in => just after sign up
      new_profile_path
    else
      # Normal login
      profiles_path
    end
  end
end
