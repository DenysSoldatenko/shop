class AttributesProduct < ApplicationRecord
  belongs_to :characteristic, class_name: "Attribute", optional: true
  belongs_to :product, optional: true
end
