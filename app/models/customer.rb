class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :products, through: :ordersend
end