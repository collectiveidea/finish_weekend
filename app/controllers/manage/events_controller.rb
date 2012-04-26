module Manage
  class EventsController < ApplicationController
    layout "management"
    
    before_filter :authenticate!
    before_filter :find_events, :find_event_by_slug

    def index
      redirect_to manage_event_path(Event.by_date.first)
    end

    def show
      @event = Event.find_by_slug! params[:id] 
    end

    def update
      params[:event][:capacity] = params[:event][:capacity].to_i
      if @event.update_attributes params[:event]
        flash[:notice] = "Updated Successfully"
        redirect_to :action => :show
      else
        flash[:error] = "Errors"
        render "show"
      end
    end

    def new
      @event = Event.new
    end

    def coupons

    end

    private

    def find_events
      @events = Event.by_date
    end

    # we use this because the global method looks at :event_id
    def find_event_by_slug
      @event = Event.find_by_slug params[:id]
    end

  end
end
