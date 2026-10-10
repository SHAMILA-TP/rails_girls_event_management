class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :name, :started_at, presence: true

  def free?
    price.nil? || price.zero?
  end

  def organizer
    user_events.find_by(is_organizer: "true")&.user
  end
end
