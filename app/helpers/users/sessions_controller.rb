# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  protected

  # After login, send user to profiles index
  def after_sign_in_path_for(resource)
    Rails.logger.info "after_sign_in_path_for (sessions) called for user: #{resource.inspect}"
    profiles_path
  end
end
