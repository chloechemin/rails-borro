class Help < ApplicationRecord
  belongs_to :user
  belongs_to :help_request

  validates :message, presence: true
end
