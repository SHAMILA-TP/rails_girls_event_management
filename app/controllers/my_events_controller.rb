class MyEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organized = current_user.organized_events.order(:started_at)
    @volunteering = current_user.volunteered_events.order(:started_at)
  end
end
