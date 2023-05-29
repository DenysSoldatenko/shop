# frozen_string_literal: true

require 'test_helper'

class DiscountTest < ActiveSupport::TestCase
  def setup
    @product = Product.create(name: 'Product 1')
    @discount = Discount.new(
      product: @product,
      percent: 10.0,
      start_date: Time.zone.today,
      end_date: Time.zone.today + 7.days
    )
  end

  test 'should be valid with valid attributes' do
    assert @discount.valid?
  end

  test 'should not be valid without a product' do
    @discount.product = nil
    assert_not @discount.valid?
  end

  test 'should not be valid without a percent' do
    @discount.percent = nil
    assert_not @discount.valid?
  end

  test 'should have a start date' do
    @discount.start_date = nil
    assert_not @discount.valid?
  end

  test 'should have an end date' do
    @discount.end_date = nil
    assert_not @discount.valid?
  end

  test 'should belong to a product' do
    assert_equal @product, @discount.product
  end
end
