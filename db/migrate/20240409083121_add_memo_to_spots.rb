class AddMemoToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :memo, :string
  end
end
