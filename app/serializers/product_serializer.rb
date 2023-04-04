class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price
  has_many :product_details
  belongs_to :category
  belongs_to :user
end
