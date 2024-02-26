class AddTravelPlans < ActiveRecord::Migration[7.0]
  def change
    add_reference :travel_plans, :group, foreign_key: true
  end
end
