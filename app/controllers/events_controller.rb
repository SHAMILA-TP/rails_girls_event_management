class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :require_organizer!, only: %i[edit update destroy]

  def index
    @events = Event.all
    @events = @events.upcoming unless params[:show_past] == "1"
    @events = @events.category(params[:category])
    @events = @events.free if params[:price] == "free"
    @events = @events.paid if params[:price] == "paid"
    @events = @events.search(params[:q])
    @events = @events.order(:started_at)

    @categories = Event.distinct.where.not(category: [nil, ""]).order(:category).pluck(:category)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.user_events.create!(user: current_user, role: "organizer")
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

    def require_organizer!
      return if @event.organized_by?(current_user)

      redirect_to @event, alert: "Only this event's organizers can do that."
    end
end
