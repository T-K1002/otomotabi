class AddTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :group, foreign_key: true
  end
end
