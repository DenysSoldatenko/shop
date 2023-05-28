# frozen_string_literal: true

require 'test_helper'

class AttributesProductTest < ActiveSupport::TestCase
  def setup
    @attribute = Attribute.create(name: 'Color')
    @product = Product.create(name: 'Product 1')
    @attributes_product = AttributesProduct.new(
      attribute_id: @attribute.id,
      product_id: @product.id,
      value: 'Red'
    )
  end

  test 'should be valid with valid attributes' do
    assert @attributes_product.valid?
  end

  test 'should not be valid without an attribute' do
    @attributes_product.attribute_id = nil
    assert_not @attributes_product.valid?
  end

  test 'should not be valid without a product' do
    @attributes_product.product_id = nil
    assert_not @attributes_product.valid?
  end

  test 'should not be valid without a value' do
    @attributes_product.value = nil
    assert_not @attributes_product.valid?
  end
end
