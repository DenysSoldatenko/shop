# frozen_string_literal: true

# This is the Review class
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
