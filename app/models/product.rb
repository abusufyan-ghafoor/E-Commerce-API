class Product < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :user, presence: true
    validates :category, presence: true
    belongs_to :category
    belongs_to :user
    has_many :product_details
    has_many :comments
    has_many :order_details
    has_many :orders, through: :order_details
end
