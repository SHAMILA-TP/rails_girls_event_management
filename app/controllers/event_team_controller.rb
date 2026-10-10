class EventTeamController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :require_organizer!

  def index
    @user_events = @event.user_events.includes(:user).order(:role)
  end

  def create
    user = User.find_by(email: params[:email].to_s.strip.downcase)

    if user.nil?
      redirect_to event_team_members_path(@event), alert: "No account found with that email."
      return
    end

    user_event = @event.user_events.new(user: user, role: params[:role] == "volunteer" ? "volunteer" : "organizer")

    if user_event.save
      redirect_to event_team_members_path(@event), notice: "#{user.name} added as #{user_event.role}."
    else
      redirect_to event_team_members_path(@event), alert: user_event.errors.full_messages.to_sentence
    end
  end

  def destroy
    user_event = @event.user_events.find(params[:id])

    if user_event.organizer? && @event.organizers.count <= 1
      redirect_to event_team_members_path(@event), alert: "An event needs at least one organizer."
      return
    end

    user_event.destroy
    redirect_to event_team_members_path(@event), notice: "Removed from the team."
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def require_organizer!
      return if @event.organized_by?(current_user)

      redirect_to @event, alert: "Only this event's organizers can manage its team."
    end
end
