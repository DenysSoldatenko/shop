# frozen_string_literal: true

# This is the Discount class
class Discount < ApplicationRecord
  belongs_to :product

  validates :percent, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
