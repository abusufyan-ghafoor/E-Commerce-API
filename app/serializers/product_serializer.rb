class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price
  has_many :product_details
  belongs_to :category
end
