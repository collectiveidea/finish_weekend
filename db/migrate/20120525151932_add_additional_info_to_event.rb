class AddAdditionalInfoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :additional_info, :string
  end
end
