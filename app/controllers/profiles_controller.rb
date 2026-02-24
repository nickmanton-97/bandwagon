class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :ensure_profile_exists, only: [:index]

  def index
    if params[:filter].present?
      @profiles = Profile.where(
        "instruments @> ARRAY[?]::varchar[] OR genres @> ARRAY[?]::varchar[]",
        params[:filter],
        params[:filter]
      )
    else
      @profiles = Profile.all
    end
  end

  def show
  end

  def new
    if current_user.profile.present?
      redirect_to profiles_path
    else
      @profile = current_user.build_profile
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profiles_path, notice: "Profile successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to profiles_path, alert: "Not authorized" unless @profile.user == current_user
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def ensure_profile_exists
    if user_signed_in? && current_user.profile.blank?
      redirect_to new_profile_path
    end
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, instruments: [], genres: [])
  end
end
