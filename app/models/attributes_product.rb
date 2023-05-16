class AttributesProduct < ApplicationRecord
  belongs_to :product_attribute, class_name: "Attribute", optional: true
  belongs_to :product, optional: true
end
