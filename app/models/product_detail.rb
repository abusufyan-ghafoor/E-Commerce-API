class ProductDetail < ApplicationRecord
    belongs_to :product
    validates :size, presence: true
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :product, presence: true
    enum size: [:small, :medium, :large, :xlarge]
end
