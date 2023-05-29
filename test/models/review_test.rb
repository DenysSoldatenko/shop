# frozen_string_literal: true

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John Doe')
    @product = Product.create(name: 'Product 1')
    @review = Review.new(
      user: @user,
      product: @product,
      rating: 4,
      comment: 'Great product!'
    )
  end

  test 'should be valid with valid attributes' do
    assert @review.valid?
  end

  test 'should not be valid without a user' do
    @review.user = nil
    assert_not @review.valid?
  end

  test 'should not be valid without a product' do
    @review.product = nil
    assert_not @review.valid?
  end

  test 'should have a valid rating' do
    @review.rating = 5
    assert @review.valid?
  end

  test 'should have a valid comment' do
    @review.comment = 'Excellent!'
    assert @review.valid?
  end
end
