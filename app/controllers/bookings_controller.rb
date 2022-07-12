class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to posts_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :user_id, :post_id, :booking_id)
  end
end
