class Sponsor < ActiveRecord::Base
  SPONSOR_LEVELS = %w(Partner Event)

  belongs_to :event

  mount_uploader :image, ImageUploader

  scope :partner, where(:level => 'Partner')
  scope :event, where(:level => 'Event')
end
