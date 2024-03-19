class RemoveDefaultRestrictFromSpots < ActiveRecord::Migration[7.0]
  def change
    change_column_default :spots, :prefecture, from: "0", to: nil
  end
end
