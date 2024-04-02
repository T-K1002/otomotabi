class CreateRecommends < ActiveRecord::Migration[7.0]
  def change
    create_table :recommends do |t|
      t.text :content

      t.timestamps
    end
  end
end
