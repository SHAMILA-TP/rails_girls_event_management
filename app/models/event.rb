class Event < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :location, :starts_at, presence: true

  scope :upcoming, -> { where("starts_at >= ?", Time.current).order(:starts_at) }

  def free?
    price.nil? || price.zero?
  end
end
