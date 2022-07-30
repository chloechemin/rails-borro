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
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
   else
    "/default_profile.jpeg"
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
           'app', 'assets', 'images', 'default_profile.jpeg'
          )
        ),
        filename: 'default_profile.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
