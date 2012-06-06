require 'spec_helper'

describe Event do
  before(:each) do
    FactoryGirl.create(:event, name: 'event #1', starts_at: '2012-01-01', ends_at: '2012-01-15')
    FactoryGirl.create(:event, name: 'event #2', starts_at: '2012-03-01', ends_at: '2012-03-15')
    FactoryGirl.create(:event, name: 'event #3', starts_at: '2012-02-01', ends_at: '2012-02-15')
  end

  describe "by_date scope" do
    it 'returns all events' do
      results = Event.by_date
      results.size.should == 3
    end

    it 'returns item #2 first' do
      results = Event.by_date
      results[0].name.should == 'event #2'
    end
  end

  describe '.previous_events' do
    before(:each) do
      Timecop.freeze(Date.parse('2012-01-20'))
    end

    it 'returns 1 event' do
      results = Event.previous_events
      results.size.should == 1
    end

    it 'returns event #1' do
      results = Event.previous_events
      results[0].name.should == 'event #1'
    end
  end

  describe '.upcoming_events' do
    before(:each) do
      Timecop.freeze(Date.parse('2012-01-20'))
    end

    it 'returns 2 events' do
      results = Event.upcoming_events
      results.size.should == 2
    end

    it 'returns event #3' do
      results = Event.upcoming_events
      results[0].name.should == 'event #3'
    end
  end

  describe '.current_events' do
    before(:each) do
      Timecop.freeze(Date.parse('2012-02-02'))
    end

    it 'returns 1 event' do
      results = Event.current_events
      results.size.should == 1
    end

    it 'returns event #3' do
      results = Event.current_events
      results[0].name.should == 'event #3'
    end
  end
end
