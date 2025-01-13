class Product < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
end
