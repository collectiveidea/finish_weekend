class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :twitter_handle
      t.string  :twitter_token
      t.text    :description
      t.string  :location
      t.text    :project
      t.string  :shirt_size
      t.text    :dietary_needs
      t.timestamps
    end

    add_index :registrations, :event_id
    add_index :registrations, :email, unique: true
    add_index :registrations, :created_at
  end
end
