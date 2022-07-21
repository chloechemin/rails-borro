class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :reviews, dependent: :destroy
  has_one :review, dependent: :destroy

  validates :start_time, :end_time, :status, :message, presence: true
  validates :check_box, inclusion: { in: [true] }
  validates :status, inclusion: { in: ['Not confirmed', 'Confirmed'] }

end
