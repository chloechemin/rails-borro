class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def landing
    redirect_to(new_user_session_path) unless current_user
  end

  def home
  end

  def my_messages
    outgoing_messages = Message.where(user_id: current_user.id)
    @help_requests = HelpRequest.where(user_id: current_user.id)
    @helps = Help.where(help_request: @help_requests)
    ingoing_messages = Message.where(user_id: @helps.pluck(:user_id))
    @messages = outgoing_messages + ingoing_messages
    @chatroom_ids = @messages.pluck(:chatroom_id).uniq
  end

  def my_bookings
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
    @bookings.each do |booking|
      @post = Post.find(booking.post_id)
    end
  end

  def my_posts
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  def my_profile
    @user = current_user
  end

  def search
  end

  def result
  end

  def post_confirmation
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

end
