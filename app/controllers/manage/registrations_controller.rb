module Manage
  class RegistrationsController < ApplicationController
    layout 'management'
    before_filter :find_events

    def index 

    end

    def destroy
      redirect_to action: :index
    end

    private

    def find_events
      @events = Event.by_date
    end
  end
end
