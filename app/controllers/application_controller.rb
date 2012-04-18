class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_future_events

  def current_event
    current_event ||= Event.where("starts_at > :today", :today => Date.current).first
  end

  private

  def find_future_events
    @events = Event.scoped
  end

end
