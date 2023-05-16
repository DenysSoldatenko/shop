require "test_helper"

class WishlistProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist_product = wishlist_products(:one)
  end

  test "should get index" do
    get wishlist_products_url
    assert_response :success
  end

  test "should get new" do
    get new_wishlist_product_url
    assert_response :success
  end

  test "should create wishlist_product" do
    assert_difference("WishlistProduct.count") do
      post wishlist_products_url, params: { wishlist_product: {  } }
    end

    assert_redirected_to wishlist_product_url(WishlistProduct.last)
  end

  test "should show wishlist_product" do
    get wishlist_product_url(@wishlist_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_wishlist_product_url(@wishlist_product)
    assert_response :success
  end

  test "should update wishlist_product" do
    patch wishlist_product_url(@wishlist_product), params: { wishlist_product: {  } }
    assert_redirected_to wishlist_product_url(@wishlist_product)
  end

  test "should destroy wishlist_product" do
    assert_difference("WishlistProduct.count", -1) do
      delete wishlist_product_url(@wishlist_product)
    end

    assert_redirected_to wishlist_products_url
  end
end
