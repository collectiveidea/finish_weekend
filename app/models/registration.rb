require "email_validator"

class Registration < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  SHIRT_SIZES = %w(XS S M L XL XXL XXXL)

  belongs_to :event

  scope :visible, where(hidden: false)

  attr_accessor :stripe_token

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :shirt_size, inclusion: {in: SHIRT_SIZES}
  validates :stripe_token, presence: true, on: :create

  before_create :charge

  def name
    "#{first_name} #{last_name}"
  end

  private
    def charge
      cost = event.price
      if coupon.present?
        used_coupon = event.coupons.find_by_code(coupon)
        cost -= used_coupon.amount if used_coupon
      end
      if cost > 0
        Stripe::Charge.create(
          amount:      (cost * 100).to_i,
          card:        stripe_token,
          currency:    "usd",
          description: I18n.t("stripe.description", event: event.name, name: name)
        )
      end
    rescue Stripe::StripeError
      errors.add(:base)
      false
    end
end
