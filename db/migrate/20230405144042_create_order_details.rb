class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :discount, precision: 10, scale: 2

      t.timestamps
    end

    add_index :order_details, [:order_id, :product_id], unique: true
  end
end