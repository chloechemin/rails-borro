class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_many :posts
  has_many :bookings
  has_many :posts_as_owner, class_name: "Post", foreign_key: :owner_id
=======
  has_many :posts, dependent: :destroy
>>>>>>> master
end
