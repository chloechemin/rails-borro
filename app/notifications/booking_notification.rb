# To deliver this notification:
#
# BookingNotification.with(post: @post).deliver_later(current_user)
# BookingNotification.with(post: @post).deliver(current_user)

class BookingNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  # post_bookings_path(params[:booking][:post_id])
  # end
end
