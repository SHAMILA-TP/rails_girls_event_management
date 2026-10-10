class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.order(:started_at)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.user_events.create!(user: current_user, is_organizer: "true")
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
      params.expect(event: [:name, :description, :location, :started_at, :ended_at, :category, :price, :image_url])
    end
end
