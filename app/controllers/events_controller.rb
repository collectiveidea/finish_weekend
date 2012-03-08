class EventsController < ApplicationController
  respond_to :html

  def index
    @events = Event.scoped
    respond_with @events
  end
end
