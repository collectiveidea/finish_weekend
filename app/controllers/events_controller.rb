class EventsController < ApplicationController
  respond_to :html
  before_filter :find_upcoming_and_previous_events

  def index
    respond_with @events
  end

  def show
    @event = Event.find_by_slug!(params[:id])
    @registrations = @event.registrations.visible
    respond_with @event
  end

  private

  def find_upcoming_and_previous_events
    @upcoming = Event.upcoming_events
    @current = Event.current_events
    @previous = Event.previous_events
  end
end
