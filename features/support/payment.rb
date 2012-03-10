module PaymentHelpers
  def charged
    new_charges.sum(&:amount).to_f / 100
  end

  def new_charges
    charges.select{|c| c.created > latest_charge.try(:created).to_i }
  end

  def charges
    Stripe::Charge.all.data.sort_by(&:created).reverse
  end

  def latest_charge
    old_charges.first
  end

  def old_charges
    @old_charges ||= charges
  end
end

World(PaymentHelpers)

Before "@payment" do
  old_charges
end
