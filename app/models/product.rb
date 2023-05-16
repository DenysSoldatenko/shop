# frozen_string_literal: true

# This is the Product class
class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :characteristics, class_name: "Attribute", through: :attributes_products
  has_many :carts_products
  has_many :carts, through: :carts_products
end
