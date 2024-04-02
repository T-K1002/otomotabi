class AddGenreToRecommends < ActiveRecord::Migration[7.0]
  def change
    add_column :recommends, :genre, :string
  end
end
