class AddDateToSpot < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :date, :date, null: false
    add_column :spots, :start_time, :time, null: false
    add_column :spots, :end_time, :time, null: false
  end
end
