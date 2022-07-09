class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :booker, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :status

      t.timestamps
    end
  end
end
