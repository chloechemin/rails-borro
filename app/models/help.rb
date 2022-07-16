class Help < ApplicationRecord
  belongs_to :user
  belongs_to :HelpRequest

  validates :message, presence: true
end
