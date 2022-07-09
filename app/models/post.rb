class Post < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :bookings, dependent: :destroy

  validates :title, :description, :category, :location, :duration, presence: true
  validates :category, inclusion: { in: ['product', 'service'] }
end
