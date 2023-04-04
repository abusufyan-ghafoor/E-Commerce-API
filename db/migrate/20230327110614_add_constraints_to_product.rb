class AddConstraintsToProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :name, :string, null: false
    change_column :products, :price, :float, null: false, default: 0.0
  end
end
