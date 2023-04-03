class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :size, :stock
  belongs_to :product
end
