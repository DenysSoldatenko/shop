# frozen_string_literal: true

# This is the Cart class
class CartsProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
