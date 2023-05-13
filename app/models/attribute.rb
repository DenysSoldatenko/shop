class Attribute < ApplicationRecord
  has_many :products, through: :attributes_products
end
