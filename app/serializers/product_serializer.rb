class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price
  has_many :product_details
  has_many :comments
  belongs_to :category
  belongs_to :user
end
