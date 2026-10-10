class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :role, { volunteer: "volunteer", organizer: "organizer" }

  validates :user_id, uniqueness: { scope: :event_id, message: "is already on this event's team" }
end
