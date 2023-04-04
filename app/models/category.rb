class Category < ApplicationRecord
    validates :name, presence: true, length: { maximum: 25 }
    validates :description, presence: true, length: { maximum: 300 }
    has_many :product, dependent: :destroy
end
