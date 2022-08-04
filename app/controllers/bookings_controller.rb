class BookingsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @bookings = Booking.where(post_id: @post.id)
  end

  def new
    @post = Post.find(params[:post_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @post = @booking.post
  end

  def create
    @booking = Booking.new(booking_params)
    @post = Post.find(params[:post_id])
    @booking.post = @post
    @booking.user = current_user
    @booking.status = "Not confirmed"
    if @booking.save
      @chatroom = Chatroom.new({ name: "#{@post.user.username.capitalize} - #{@post.title.capitalize}" })
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
      PostNotification.with(booking: @booking, message: "#{current_user.username} has made a booking on your post").deliver(@post.user)
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
    @post = @booking.post
    @booking.update(booking_params)
    redirect_to post_booking_path(@booking)
    PostNotification.with(booking: @booking, message: "#{current_user.username} has edited their booking on your post").deliver(@post.user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @post = @booking.post
    @booking.status = "Confirmed"
    @booking.save
    redirect_to post_bookings_path(@booking.post)
    BookingNotification.with(post: @post, message: "#{current_user.username} has accepted your booking!").deliver(@booking.user)
  end

  def decline
    @booking = Booking.find(params[:id])
    @post = @booking.post
    @booking.status = "Not confirmed"
    @booking.save
    redirect_to post_bookings_path(@booking.post)
    BookingNotification.with(post: @post, message: "#{current_user.username} has rejected your booking!").deliver(@booking.user)
  end

  def request_review
    @booking = Booking.find(params[:id])
    @post = @booking.post
    redirect_to post_bookings_path(@booking.post)
    ReviewNotification.with(post: @post, booking: @booking, message: "#{current_user.username} has requested for you to leave a review!").deliver(@booking.user)
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
