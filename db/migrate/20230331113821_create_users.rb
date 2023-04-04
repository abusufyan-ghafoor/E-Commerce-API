class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.integer :role

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :name

    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :address, false
    change_column_null :users, :role, false
  end
end
