class ChangeTravelPlansToTrips < ActiveRecord::Migration[7.0]
  def change
    rename_table :travel_plans, :trips
  end
end
