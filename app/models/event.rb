class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :name, :started_at, presence: true

  scope :upcoming, -> { where("started_at >= ?", Time.current) }
  scope :category, ->(category) { where(category: category) if category.present? }
  scope :free, -> { where(price: [nil, 0]) }
  scope :paid, -> { where.not(price: [nil, 0]) }
  scope :search, ->(term) {
    where("name LIKE :q OR description LIKE :q OR location LIKE :q", q: "%#{term}%") if term.present?
  }

  def free?
    price.nil? || price.zero?
  end

  def organizers
    users.where(user_events: { role: "organizer" })
  end

  def volunteers
    users.where(user_events: { role: "volunteer" })
  end

  def organized_by?(user)
    return false unless user
    user_events.exists?(user_id: user.id, role: "organizer")
  end
end
