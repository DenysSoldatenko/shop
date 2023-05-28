# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    product = Product.new(
      name: 'Product 1',
      price: 10.0,
      quantity: 5
    )
    assert product.valid?
  end

  test 'should not be valid without a name' do
    product = Product.new(
      price: 10.0,
      quantity: 5
    )
    assert_not product.valid?
  end

  test 'should not be valid without a price' do
    product = Product.new(
      name: 'Product 1',
      quantity: 5
    )
    assert_not product.valid?
  end

  test 'should not be valid with a non-integer quantity' do
    product = Product.new(
      name: 'Product 1',
      price: 10.0,
      quantity: "5.5"
    )
    assert_not product.valid?
  end

  test 'should not be valid with a negative price' do
    product = Product.new(
      name: 'Product 1',
      price: -10.0,
      quantity: 5.5
    )
    assert_not product.valid?
  end

  test 'should not be valid with a negative quantity' do
    product = Product.new(
      name: 'Product 1',
      price: 10.0,
      quantity: -5.5
    )
    assert_not product.valid?
  end
end
