class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :status

      t.timestamps
    end
  end
end
