class Event < ActiveRecord::Base
  has_many :registrations, dependent: :restrict, inverse_of: :event

  before_create :set_slug

  def to_param
    slug
  end

  private
    def set_slug
      self.slug ||= name.parameterize
    end
end
