class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  validates :name, presence: true

  def organized_events
    events.where(user_events: { role: "organizer" })
  end

  def volunteered_events
    events.where(user_events: { role: "volunteer" })
  end
end
