module Manage
  class SponsorsController < ApplicationController
    layout 'management'
    before_filter :authenticate!
    before_filter :find_events

    def index
    end

    def new 
      @sponsor = Sponsor.new
    end

    def create
      sponsor = @event.sponsors.build params[:sponsor]
      if sponsor.save
        flash[:notice] = 'Sponsor Created Successfully'
        redirect_to action: :index
      else
        flash[:error] = 'Errors'
        render 'new'
      end
    end

    def edit
      @sponsor = Sponsor.find_by_id(params[:id])
    end

    def update
      sponsor = Sponsor.find_by_id(params[:id])
      if sponsor.update_attributes params[:sponsor]
        flash[:notice] = 'Sponsor Updated Successfully'
        redirect_to action: :index
      else
        flash[:error] = 'Errors'
        render 'edit'
      end
    end

    def destroy
      Sponsor.delete(params[:id])
      redirect_to action: :index
    end

    private 

    def find_events
      @events = Event.by_date
    end
  end


end
