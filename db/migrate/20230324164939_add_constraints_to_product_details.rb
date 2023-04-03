class AddConstraintsToProductDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :product_details, :size, :integer, null: false, default: 0
    change_column :product_details, :stock, :integer, null: false, default: 0
  end
end
