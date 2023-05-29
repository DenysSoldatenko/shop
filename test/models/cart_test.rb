# frozen_string_literal: true

require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.new(
      session_id: 'abc123',
      total: 100.0
    )
  end

  test 'should be valid with valid attributes' do
    assert @cart.valid?
  end

  test 'should not be valid without a session ID' do
    @cart.session_id = nil
    assert_not @cart.valid?
  end

  test 'should have products' do
    product = Product.create(name: 'Product 1')
    @cart.products << product

    assert_not @cart.products.empty?
  end
end
