class RegistrationsController < ApplicationController
  respond_to :html

  before_filter :load_event

  def new
    @registration = @event.registrations.build
    respond_with @registration
  end

  def create
    @registration = @event.registrations.create(params[:registration])
    if @registration.persisted?
      flash[:notice] = t("flash.registration_created")
    else
      flash.now[:error] = t("flash.registration_error")
    end
    respond_with @registration, location: @event
  end

  private
    def load_event
      @event = Event.find_by_slug!(params[:event_id])
    end
end
