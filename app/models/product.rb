# frozen_string_literal: true

# This is the Product class
class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :attributes_products
  has_many :product_attributes, through: :attributes_products, class_name: 'Attribute'
end
