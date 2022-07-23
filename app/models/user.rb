class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :bookings
  has_many :messages
  has_many :participants
  has_many :chatrooms, through: :participants

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
