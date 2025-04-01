class BookingsController < ApplicationController
  def index
    @bookings = Booking.all # You might want to filter this to `current_profile`
  end

  def create
  end

  def destroy
  end
end
