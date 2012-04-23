class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :event_id
      t.string  :code
      t.decimal :amount
      t.timestamps
    end
  end
end
