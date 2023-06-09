# frozen_string_literal: true

# This is the Cart class
class Cart < ApplicationRecord
  has_many :carts_products
  has_many :products, through: :carts_products

  validates :session_id, presence: true
end
