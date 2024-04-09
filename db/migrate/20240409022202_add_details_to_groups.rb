class AddDetailsToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :name, :string, null: false
    add_index :groups, :name, unique: true
    add_column :groups, :introduction, :string
  end
end
