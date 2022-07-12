class AddMessageToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :message, :text
  end
end
