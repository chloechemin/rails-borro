class Booking < ApplicationRecord
  belongs_to :booker_id, class_name: "User"
  belongs_to :post_id

  validates :start_time, :end_time, :status, presence: true
  validates :status, inclusion: { in: ['Not confirmed', 'Confirmed'] }
end
