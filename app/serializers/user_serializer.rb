class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :role
  has_many :products
end
