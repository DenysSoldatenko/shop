# frozen_string_literal: true

# This is the WishlistProduct class
class WishlistProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
