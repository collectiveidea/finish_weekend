require "spec_helper"

describe ApplicationController do
  describe "#current_event" do
    before(:each) do
      @target = ApplicationController.new
      FactoryGirl.create(:event, :name => 'Ann Arbor', :starts_at => '2012-02-25', :ends_at => '2012-02-26')
      FactoryGirl.create(:event, :name => 'Boston', :starts_at => '2012-03-24', :ends_at => '2012-03-25')
      FactoryGirl.create(:event, :name => 'Atlanta', :starts_at => '2012-06-02', :ends_at => '2012-06-03')
    end

    it 'should return the ann arbor event' do
      Timecop.freeze(Date.parse('2012-02-01'))
      @target.current_event.name.should == 'Ann Arbor'
    end

    it 'should return the boston event' do
      Timecop.freeze(Date.parse('2012-03-01'))
      @target.current_event.name.should == 'Boston'
    end

    it 'should return the boston event during the event' do
      Timecop.freeze(Date.parse('2012-03-24'))
      @target.current_event.name.should == 'Boston'
    end

    it 'should the last event if no future events' do
      Timecop.freeze(Date.parse('2012-07-01'))
      @target.current_event.name.should == 'Atlanta'
    end
  end
end
