class AddPolymorphicAssociationToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
    add_index :comments, :commentable_id
    remove_column :comments, :product_id, :integer
  end
end
