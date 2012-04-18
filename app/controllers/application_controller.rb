class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_event
    current_event ||= Event.where("starts_at > :today", :today => Date.current).first
  end
end
