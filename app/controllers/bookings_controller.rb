class BookingsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @bookings = Booking.where(post_id: @post.id)
    @bookings.each do |booking|
      @user = User.find(booking.user_id)
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @post = Post.find(params[:post_id])
    @booking.post = @post
    @booking.user = current_user
    @booking.status = "Not confirmed"
    if @booking.save
      @chatroom = Chatroom.new({ name: "#{@post.title} - #{current_user.username}" })
      @chatroom.save
      @message = Message.new({ content: @booking.message })
      @message.chatroom = @chatroom
      @message.user = current_user
      @message.save
      @participant_user = Participant.new({ chatroom_id: @chatroom.id, user_id: current_user.id })
      @participant_user.save
      @participant_post_user = Participant.new({ chatroom_id: @chatroom.id, user_id: @post.user.id })
      @participant_post_user.save
      redirect_to post_booking_path(@post, @booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @post = @booking.post
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to post_booking_path(@booking)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Confirmed"
    @booking.save
    redirect_to post_bookings_path(@booking.post)
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Not confirmed"
    @booking.save
    redirect_to post_bookings_path(@booking.post)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to posts_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status, :message, :user_id, :post_id, :booking_id)
  end
end
