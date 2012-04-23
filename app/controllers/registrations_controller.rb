class RegistrationsController < ApplicationController
  respond_to :html, :except => :coupon
  respond_to :json, :only   => :coupon

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

  def coupon
    coupon = @event.coupons.find_by_code(params[:coupon_code])
    render :json => coupon if coupon
    render :nothing => true, :status => 404 unless coupon
  end

  private
    def load_event
      @event = Event.find_by_slug!(params[:event_id])
    end
end
