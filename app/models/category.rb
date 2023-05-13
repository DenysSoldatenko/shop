class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_and_belongs_to_many :products

  def descendants
    self.children | self.children.map(&:descendants).flatten
  end

end
