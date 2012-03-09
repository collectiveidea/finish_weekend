class Event < ActiveRecord::Base
  has_many :registrations, dependent: :restrict, inverse_of: :event
end
