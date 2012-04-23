class ManageController < ApplicationController
  layout "management"
  before_filter :find_events
  before_filter :find_event_by_slug, :except => :index

  def index
    redirect_to event_manage_path(Event.by_date.first)
  end

  def show 
  end

  def update
    params[:event][:capacity] = params[:event][:capacity].to_i
    if @event.update_attributes params[:event]
      flash[:notice] = "Updated Successfully"
    end
    redirect_to :action => :show
  end

  private

  def find_events
    @events = Event.by_date()
  end

  def find_event_by_slug
    @event = Event.find_by_slug! params[:slug]
  end
end
