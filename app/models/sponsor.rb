class Sponsor < ActiveRecord::Base
  SPONSOR_LEVELS = %w(Partner Premier Event)

  belongs_to :event

  mount_uploader :image, ImageUploader

  scope :premier, where(:level => 'Premier')
  scope :event, where(:level => 'Event')

  def self.partner
    where(:level => 'Partner').first
  end
end
