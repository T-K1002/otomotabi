class CreateTravelPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_plans do |t|
      t.string :title

      t.timestamps
    end
  end
end
