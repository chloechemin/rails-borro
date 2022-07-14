class Post < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :category, :location, :duration, presence: true
  validates :category, inclusion: { in: ['product', 'service'] }

end
