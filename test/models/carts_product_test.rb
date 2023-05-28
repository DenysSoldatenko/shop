# frozen_string_literal: true

require 'test_helper'

class CartsProductTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.create(session_id: 'abc123', total: 100.0)
    @product = Product.create(name: 'Product 1')
    @carts_product = CartsProduct.new(
      cart: @cart,
      product: @product,
      quantity: 2
    )
  end

  test 'should be valid with valid attributes' do
    assert @carts_product.valid?
  end

  test 'should not be valid without a cart' do
    @carts_product.cart = nil
    assert_not @carts_product.valid?
  end

  test 'should not be valid without a product' do
    @carts_product.product = nil
    assert_not @carts_product.valid?
  end
end
