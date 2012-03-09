class Registration < ActiveRecord::Base
  SHIRT_SIZES = %w(XS S M L XL XXL XXXL)

  belongs_to :event

  def name
    "#{first_name} #{last_name}"
  end
end
