class Product < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    belongs_to :category
    has_many :product_details
end
