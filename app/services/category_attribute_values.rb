class CategoryAttributeValues
  def self.call(category, params)
    attributes_values = []
    Attribute.all.each do |attribute|
      values = []
      category.get_all_children_products.each do |product|
         value = AttributesProduct.find_by(attribute_id: attribute.id, product_id: product.id).value
         if params[attribute.name_eng] == nil
           values << [value, false] unless values.flatten.include?(value) || value == nil
         else
           values << [value, params[attribute.name_eng].values.include?(value)] unless values.flatten.include?(value) || value == nil
         end
      end
      attributes_values << [attribute.name, attribute.name_eng, values]
    end
    return attributes_values
  end
end