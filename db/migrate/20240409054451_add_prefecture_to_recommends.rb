class AddPrefectureToRecommends < ActiveRecord::Migration[7.0]
  def change
    add_column :recommends, :prefecture, :integer, null: false
  end
end
