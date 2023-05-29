# frozen_string_literal: true

# This is the Category class
class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_and_belongs_to_many :products

  validates :name, presence: true
  def descendants
    children | children.map(&:descendants).flatten
  end

  def get_all_children_products
    Product.joins(:categories).merge(Category.where(id: id)) |
      Product.joins(:categories).merge(Category.where(id: descendants.map(&:id)))
  end

  def ancestors
    return Array(self) if parent.nil?

    ancestors = parent.ancestors
    return [self, parent].flatten if ancestors.nil?

    [self, parent].flatten | ancestors.flatten
  end
end
