class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
end
