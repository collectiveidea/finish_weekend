class HomeController < ApplicationController
  def index
    @upcoming = Event.upcoming_events
  end

  def faq
  end

  def sponsors
  end

  def letsencrypt
    # use your code here, not mine
    render text: ENV["LETS_ENCRYPT_CHALLENGE"]
  end
end
