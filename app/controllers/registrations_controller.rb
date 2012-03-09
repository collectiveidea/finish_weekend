class RegistrationsController < ApplicationController
  respond_to :html

  before_filter :load_event

  def new
    @registration = @event.registrations.build
    respond_with @registration
  end

  def create
    @registration = @event.registrations.create(params[:registration])
    flash[:notice] = t("flash.registration_created") if @registration.persisted?
    respond_with @registration, location: @event
  end

  private
    def load_event
      @event = Event.find_by_slug!(params[:event_id])
    end
end
