class ChangeDataPrefectureToRecommends < ActiveRecord::Migration[7.0]
  def change
    change_column :recommends, :prefecture, :string
  end
end
