class Review < ApplicationRecord

  belongs_to :booking


  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }

end
