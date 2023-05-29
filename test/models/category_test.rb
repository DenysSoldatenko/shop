# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(
      name: 'Electronics',
      description: 'Electronics category'
    )
  end

  test 'should be valid with valid attributes' do
    assert @category.valid?
  end

  test 'should not be valid without a name' do
    @category.name = nil
    assert_not @category.valid?
  end

  test 'should have a parent category' do
    parent_category = Category.create(name: 'Parent Category')
    @category.parent = parent_category
    assert_equal parent_category, @category.parent
  end

  test 'should have children categories' do
    child_category = Category.create(name: 'Child Category', parent: @category)
    assert_includes @category.children, child_category
  end

  test 'should have associated products' do
    product = Product.create(name: 'Product 1')
    @category.products << product
    assert_includes @category.products, product
  end
end
