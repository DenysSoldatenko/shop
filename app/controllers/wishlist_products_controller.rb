# frozen_string_literal: true

# This is the WishlistProductsController class
class WishlistProductsController < ApplicationController
  before_action :set_user, :set_product, :authenticate_user!

  def show
    @wishlist = []
    @user.wishlist_products.each do |item|
      @wishlist << Product.find(item.product_id)
    end
    @products = Product.all.sample(5)
  end

  def add_product_to_wishlist
    WishlistProduct.create(product: @product, user: @user) if WishlistProduct.find_by(product: @product,
                                                                                      user: @user).nil?
    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  def delete_product_from_wishlist
    WishlistProduct.find_by(product: @product, user: @user).destroy
    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
