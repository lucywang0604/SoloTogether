class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_experience, only: [:create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_profile.bookings.order(date: :asc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.profile = current_profile

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render "experiences/show", status: :unprocessable_entity
    end
  end

  def destroy
    if @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully cancelled.'
    else
      redirect_to bookings_path, alert: 'Unable to cancel booking.'
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_booking
    @booking = current_profile.bookings.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bookings_path, alert: "Booking not found"
  end

  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end
end
