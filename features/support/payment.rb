module PaymentHelpers
  def payments
    Stripe::Charge.all.data.sum(&:amount).to_f / 100
  end

  def old_payments
    @old_payments ||= payments
  end

  def new_payments
    payments - old_payments
  end
end

World(PaymentHelpers)

Before "@payment" do
  old_payments
end
