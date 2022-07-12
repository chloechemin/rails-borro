class BookingsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @post = Post.find(params[:post_id])
    @booking.post = @post
    @booking.status = "Not confirmed"
    if @booking.save
      redirect_to post_booking_path(@post, @booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params[:booking])
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status)
  end
end
