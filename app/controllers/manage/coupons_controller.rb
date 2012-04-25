module Manage
  class CouponsController < ApplicationController
    layout "management"
    before_filter :authenticate!, :find_events

    def index
    end

    def new
      @coupon = Coupon.new
    end
    
    def create
      coupon = @event.coupons.build params[:coupon]
      if coupon.save
        flash[:notice] = "Created Coupon Successfully."
        redirect_to action: :index
      else
        flash[:error] = 'Errors'
        render 'new'
      end
    end

    def edit
      @coupon = Coupon.find_by_id! params[:id] 
    end

    def update
      coupon = Coupon.find_by_id! params[:id]
      coupon.update_attributes params[:coupon]
      redirect_to action: :index
    end

    def destroy
      Coupon.delete params[:id]
      redirect_to action: :index
    end

    private

    def find_events
      @events = Event.by_date
    end

  end
end
