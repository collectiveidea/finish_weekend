class Event < ActiveRecord::Base
  has_many :registrations, dependent: :restrict, inverse_of: :event
  has_many :sponsors

  before_create :set_slug

  def self.upcoming_events
    where("starts_at > :date", :date => Date.current).order(:starts_at).scoped
  end
  
  def self.previous_events
    where("ends_at < :date", :date => Date.current).order("starts_at DESC").scoped
  end

  def to_param
    slug
  end

  private
  
  def set_slug
    self.slug ||= name.parameterize
  end
end
