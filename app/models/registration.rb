require "email_validator"

class Registration < ActiveRecord::Base
  SHIRT_SIZES = %w(XS S M L XL XXL XXXL)

  belongs_to :event

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
      Stripe::Charge.create(
        amount:      (event.price * 100).to_i,
        card:        stripe_token,
        currency:    "usd",
        description: I18n.t("stripe.description", event: event.name, name: name)
      )
    rescue Stripe::StripeError
      errors.add(:base)
      false
    end
end
