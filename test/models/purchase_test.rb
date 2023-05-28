require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  def setup
    @product = Product.create(name: 'Product 1', price: 10.0, quantity: 5)
    @purchase = Purchase.new(
      quantity: 2,
      date: DateTime.now,
      price: 20.0,
      product: @product
    )
  end

  test 'should be valid with valid attributes' do
    assert @purchase.valid?
  end

  test 'should not be valid without a quantity' do
    @purchase.quantity = nil
    assert_not @purchase.valid?
  end

  test 'should not be valid without a date' do
    @purchase.date = nil
    assert_not @purchase.valid?
  end

  test 'should not be valid without a price' do
    @purchase.price = nil
    assert_not @purchase.valid?
  end

  test 'should not be valid without a product' do
    @purchase.product = nil
    assert_not @purchase.valid?
  end

  test 'should be valid with valid quantity' do
    @purchase.quantity = 1
    assert @purchase.valid?
  end

  test 'should have a valid price' do
    @purchase.price = -10.0
    assert_not @purchase.valid?
  end
end
