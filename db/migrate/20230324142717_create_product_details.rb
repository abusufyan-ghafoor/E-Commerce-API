class CreateProductDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :product_details do |t|
      t.integer :size
      t.integer :stock
      t.references :product, foreign_key: { to_table: :products }

      t.timestamps
    end
  end
end
