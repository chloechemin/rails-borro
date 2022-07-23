class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :reviews, dependent: :destroy
  has_one :review, dependent: :destroy

  validates :start_time, :end_time, :status, :message, presence: true
  validates :check_box, acceptance: true
  validates :status, inclusion: { in: ['Not confirmed', 'Confirmed'] }

  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start date/time!")
    end
  end
end
