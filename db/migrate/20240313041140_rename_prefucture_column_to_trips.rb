class RenamePrefuctureColumnToTrips < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :prefucture, :prefecture
  end
end
