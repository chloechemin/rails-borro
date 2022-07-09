class Participant < ApplicationRecord
  belongs_to :room_id
  belongs_to :user_id
end
