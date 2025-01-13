class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belogns_to :product

  validate :content, presence: true, length: { minimum: 10 }
end
