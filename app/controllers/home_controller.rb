class HomeController < ApplicationController
  def index
    # Devise objects for the signup/login forms
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end
end
