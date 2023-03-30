class AddValidationsToCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :name, :text, null: false
    change_column :categories, :description, :text, null: false
  end
end
