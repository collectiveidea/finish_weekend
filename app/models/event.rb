class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :registrations, dependent: :restrict
  has_many :sponsors
  has_many :coupons

  validates :name, presence: true

  before_create :set_slug

  scope :by_date, order("starts_at DESC")

  def self.upcoming_events(date = Date.current)
    where("starts_at > :date", :date => date).order(:starts_at)
  end

  def self.current_events(date = Date.current)
    where("starts_at <= :date AND ends_at >= :date", :date => date).order(:starts_at)
  end

  def self.previous_events(date = Date.current)
    where("ends_at < :date", :date => date).order("starts_at DESC")
  end

  def to_param
    slug
  end

  private
  
  def set_slug
    self.slug ||= name.parameterize
  end
end
