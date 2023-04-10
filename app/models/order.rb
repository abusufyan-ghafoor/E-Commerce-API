class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  has_many :comments, as: :commentable
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, :comments

  validates :address, presence: true
  validates :total_bill, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
