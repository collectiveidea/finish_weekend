class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string  :name
      t.string  :url
      t.integer :event_id

      t.timestamps
    end
  end
end
