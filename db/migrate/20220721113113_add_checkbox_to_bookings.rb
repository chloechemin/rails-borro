class AddCheckboxToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :check_box, :boolean
  end
end
