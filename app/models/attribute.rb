# frozen_string_literal: true

# This is the Attribute class
class Attribute < ApplicationRecord
  has_many :products, through: :attributes_products
end
