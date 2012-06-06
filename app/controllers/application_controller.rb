class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_future_events, :find_current_event, :find_event_by_slug

  def current_event
    current = Event.where("starts_at <= :today AND ends_at >= :today", :today => Date.current).first
    future = Event.where("starts_at > :today", :today => Date.current).order('starts_at').first
    past = Event.by_date.first

    current || future || past
  end

  def authenticate!
    redirect_to new_sessions_path unless session[:user] && session[:user][:valid] == true
  end

  private

  def find_future_events
    @events = Event.scoped
  end

  def find_current_event
    @current_event = current_event
  end

  def find_event_by_slug
    @event = Event.find_by_slug! params[:event_id] if params.include? :event_id
  end
end
