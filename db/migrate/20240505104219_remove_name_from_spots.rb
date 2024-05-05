class RemoveNameFromSpots < ActiveRecord::Migration[7.0]
  def change
    remove_column :spots, :name, :string
  end
end
