class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :orders, dependent: :destroy
  has_many :customers, through: :orders
end
