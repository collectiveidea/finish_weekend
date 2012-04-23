class HomeController < ApplicationController
  def index
    @upcoming = Event.upcoming_events
  end

  def faq
  end
end
