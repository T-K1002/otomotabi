class AddPrefectureToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :prefecture, :integer, null: false, default: 0
  end
end