class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_bookings
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  def search
  end

  def result
  end

end
