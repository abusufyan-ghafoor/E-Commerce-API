class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :total_bill, :created_at

  has_many :products, through: :order_details
  has_many :order_details
end
