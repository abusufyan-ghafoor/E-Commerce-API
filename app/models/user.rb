class User < ApplicationRecord
    enum role: [:admin, :manager, :client]
    validates :name, presence: true, length: { maximum: 25 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :address, presence: true, length: { maximum: 100 }
    validates :role, presence: true
    has_many :products
end
