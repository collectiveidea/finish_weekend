class EventsController < ApplicationController
  respond_to :html

  def index
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
    respond_with @events
  end

  def show
    @event = Event.find_by_slug!(params[:id])
    @registrations = @event.registrations.visible
    respond_with @event
  end
end
