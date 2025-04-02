class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show]

  def index
    @bookings = current_profile.bookings.order(date: :asc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
  end

  def destroy
  end

  private

  def set_booking
    @booking = current_profile.bookings.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bookings_path, alert: "Booking not found"
  end

end
