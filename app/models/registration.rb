class Registration < ActiveRecord::Base
  SHIRT_SIZES = %w(XS S M L XL XXL XXXL)

  belongs_to :event

  attr_accessor :stripe_token

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
    end
end
