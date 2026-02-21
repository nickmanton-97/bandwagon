class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update]

  # GET /profiles
  def index
    if params[:filter].present?
      # Adjust depending on how instruments/genres are stored
      @profiles = Profile.where("instruments @> ARRAY[?]::varchar[] OR genres @> ARRAY[?]::varchar[]", params[:filter], params[:filter])
    else
      @profiles = Profile.all
    end
  end

  # GET /profiles/:id
  def show
  end

  # GET /profiles/new
  def new
    @profile = current_user.build_profile
  end

  # POST /profiles
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile, notice: "Profile successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /profiles/:id/edit
  def edit
    redirect_to profiles_path, alert: "Not authorized" unless @profile.user == current_user
  end

  # PUT/PATCH /profiles/:id
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, instruments: [], genres: [])
  end
end
