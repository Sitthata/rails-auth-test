class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product

  validates :content, presence: true, length: { minimum: 10 }
end
