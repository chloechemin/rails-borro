class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :reviews, dependent: :destroy

  validates :start_time, :end_time, :status, :message, presence: true
  validates :status, inclusion: { in: ['Not confirmed', 'Confirmed'] }

end
