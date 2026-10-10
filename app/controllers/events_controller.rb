class EventsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :require_organizer, only: %i[new create edit update destroy]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :require_owner, only: %i[edit update destroy]

  def index
    @events = Event.order(:starts_at)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Current.user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted."
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.expect(event: [:title, :description, :location, :starts_at, :category, :price, :image_url])
    end

    def require_organizer
      redirect_to events_path, alert: "Only organizers can do that." unless Current.user&.organizer?
    end

    def require_owner
      redirect_to events_path, alert: "You can only manage your own events." unless @event.user == Current.user
    end
end
