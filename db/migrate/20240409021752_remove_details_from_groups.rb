class RemoveDetailsFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :name, :string
    remove_column :groups, :introduction, :text
  end
end
