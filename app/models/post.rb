class Post < ApplicationRecord
  belongs_to :owner_id, class_name: "User"

  has_many :bookings, dependent: :destroy

  validates :title, :description, :category, :location, :max_duration, presence: true
  validates :category, inclusion: { in: ['product', 'service'] }
end
