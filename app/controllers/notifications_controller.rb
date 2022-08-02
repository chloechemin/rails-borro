class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.unread
  end

  def read_all
    current_user.notifications.mark_as_read!
    redirect_to notifications_path
  end
end
