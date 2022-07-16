class Post < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :category, :location, :duration, presence: true
  validates :category, inclusion: { in: ['product', 'service'] }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
