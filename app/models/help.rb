class Help < ApplicationRecord
  belongs_to :user
  belongs_to :help_request

  validates :message, presence: true

  geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
end
