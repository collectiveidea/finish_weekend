class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :slug
      t.string   :partner
      t.string   :host
      t.string   :venue
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :country
      t.datetime :starts_at
      t.datetime :ends_at
      t.decimal  :price, precision: 6, scale: 2
      t.integer  :capacity
      t.string   :name
      t.text     :description
      t.text     :schedule
      t.text     :registration_email
      t.text     :reminder_email
      t.timestamps
    end

    add_index :events, :slug, unique: true
    add_index :events, :starts_at
    add_index :events, :ends_at
    add_index :events, :created_at
  end
end
