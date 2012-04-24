class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_future_events, :find_current_event

  def current_event
    current_event ||= Event.where("starts_at > :today", :today => Date.current).first
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

end
