# frozen_string_literal: true

# This is the Purchase class
class Purchase < ApplicationRecord
  belongs_to :product
end
