class Booking < ApplicationRecord
  belongs_to :booker_id
  belongs_to :post_id
end
