class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.joins(:city).near(current_user.profile.current_city.name, 10)
  end

  def show
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.profile = current_profile
    @experience.city = current_profile.current_city

    if @experience.save
      redirect_to profile_path(current_profile), notice: 'Experience was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      redirect_to profile_path(current_profile), notice: 'Experience was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to profile_path(current_profile), notice: 'Experience was successfully deleted.'
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name, :description, :price, :photo, :duration)
  end
end
