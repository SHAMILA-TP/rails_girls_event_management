class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :events, dependent: :destroy

  enum :role, { attendee: 0, organizer: 1 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :name, presence: true
end
