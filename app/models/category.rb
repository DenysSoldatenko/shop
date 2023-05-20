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
    Product.joins(:categories).merge(Category.where(id: self.id)) | Product.joins(:categories).merge(Category.where(id: self.descendants.map(&:id)))
  end

  def ancestors
    if self.parent == nil
      return
    else
      ancestors = self.parent.ancestors
      if ancestors == nil
        return [self, self.parent].flatten
      else
        return [self, self.parent].flatten & ancestors.flatten
      end
    end
  end
end
