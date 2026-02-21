Rails.application.routes.draw do
  get "home/index"
  root "home#index"

  # Devise routes with custom controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',  # handles sign up
    sessions: 'users/sessions'             # handles log in
  }

  resources :profiles

  # Optional 'interested in' functionality
  # resources :interests, only: [:create, :index, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
