class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    redirect_to(new_user_session_path) unless current_user
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

  def search
  end

  def result
  end

end
