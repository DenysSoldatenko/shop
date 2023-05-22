# frozen_string_literal: true

require 'application_system_test_case'

class WishlistProductsTest < ApplicationSystemTestCase
  setup do
    @wishlist_product = wishlist_products(:one)
  end

  test 'visiting the index' do
    visit wishlist_products_url
    assert_selector 'h1', text: 'Wishlist products'
  end

  test 'should create wishlist product' do
    visit wishlist_products_url
    click_on 'New wishlist product'

    click_on 'Create Wishlist product'

    assert_text 'Wishlist product was successfully created'
    click_on 'Back'
  end

  test 'should update Wishlist product' do
    visit wishlist_product_url(@wishlist_product)
    click_on 'Edit this wishlist product', match: :first

    click_on 'Update Wishlist product'

    assert_text 'Wishlist product was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Wishlist product' do
    visit wishlist_product_url(@wishlist_product)
    click_on 'Destroy this wishlist product', match: :first

    assert_text 'Wishlist product was successfully destroyed'
  end
end
