class Event < ActiveRecord::Base
  has_many :registrations, dependent: :restrict
  has_many :sponsors
  has_many :coupons

  before_create :set_slug

  scope :upcoming_events, where("starts_at > :date", :date => Date.current).order(:starts_at)
  scope :previous_events, where("ends_at < :date", :date => Date.current).order("starts_at DESC")

  def to_param
    slug
  end

  private
  
  def set_slug
    self.slug ||= name.parameterize
  end
end
