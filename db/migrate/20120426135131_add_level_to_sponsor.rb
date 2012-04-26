class AddLevelToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :level, :string

  end
end
