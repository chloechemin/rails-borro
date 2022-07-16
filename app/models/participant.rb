class Participant < ApplicationRecord
  belongs_to :chatroom
  has_many :users
end
