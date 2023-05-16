# frozen_string_literal: true

# This is the Category class
class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_and_belongs_to_many :products

  def descendants
    self.children | self.children.map(&:descendants).flatten
  end

  def get_all_children_products
    children = self.descendants
    products = []
    children.each do |category|
      category.products.each do |product|
        products.push(product) unless products.include?(product)
      end
    end
    self.products.each do |product|
      products.push(product) unless products.include?(product)
    end
    return products
  end

  def ancestors
    if self.parent == nil
      return
    end
    return [self, self.parent, self.parent.ancestors].flatten
  end

end
