class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :posts
  has_many :bookings
  has_many :messages
  has_many :participants
  has_many :chatrooms, through: :participants
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    # else
    #   "default-avatar.png"
    end
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
           'app', 'assets', 'images', 'default-avatar.png'
          )
        ),
        filename: 'default-avatar.png',
        content_type: 'image/png'
      )
    end
  end
end
