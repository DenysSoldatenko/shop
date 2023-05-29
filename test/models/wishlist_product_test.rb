# frozen_string_literal: true

require 'test_helper'

class WishlistProductTest < ActiveSupport::TestCase
  def setup
    @wishlist_product = WishlistProduct.new(product: products(:one), user: users(:one))
  end

  test 'should be valid' do
    assert @wishlist_product.valid?
  end

  test 'should require a product' do
    @wishlist_product.product = nil
    assert_not @wishlist_product.valid?
  end

  test 'should require a user' do
    @wishlist_product.user = nil
    assert_not @wishlist_product.valid?
  end
end
