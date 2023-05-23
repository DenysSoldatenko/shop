# frozen_string_literal: true

# This is the Product class
class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :attributes_products
  has_many :characteristics, class_name: 'Attribute', through: :attributes_products
  has_many :carts_products
  has_many :carts, through: :carts_products

  def get_rating
    ratings = Review.where(product_id: id).map(&:rating)
    return (ratings.sum / ratings.length).round unless ratings.empty?

    0
  end

  def get_current_price
    (price * (100 - get_current_discount) / 100).round(2)
  end

  def get_current_discount
    Discount.where('product_id = ? AND start_date < ? AND end_date > ?',
                   id, Time.zone.today, Time.zone.today).map(&:percent).sum
  end
end
