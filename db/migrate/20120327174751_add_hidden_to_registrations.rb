class AddHiddenToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :hidden, :boolean, null: false, default: false
    add_index :registrations, :hidden
  end
end
