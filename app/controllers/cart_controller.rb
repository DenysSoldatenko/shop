class CartController < ApplicationController
  before_action :set_cart
  protect_from_forgery except: :show

  def add_product_to_cart
    product = Product.find_by_id(params[:product_id])
    @cart.products.append(product) unless @cart.products.include?(product)
  end

  def delete_product_from_cart
    product = Product.find_by_id(params[:product_id])
    @cart.products.delete(product)
    redirect_to :action => "show"
  end

  def increase_product_quantity
    product = Product.find_by_id(params[:product_id])
    quantity = @cart.carts_products.find_by(product_id: product.id).quantity
    @cart.carts_products.find_by(product_id: product.id).update(quantity: quantity+1)
    redirect_to :action => "show"
  end

  def decrease_product_quantity
    product = Product.find_by_id(params[:product_id])
    quantity = @cart.carts_products.find_by(product_id: product.id).quantity
    @cart.carts_products.find_by(product_id: product.id).update(quantity: quantity-1)
    redirect_to :action => "show"
  end

  def show
    @total = 0
    @cart.carts_products.each do |item|
      if Discount.find_by(product_id: item.product.id) !=nil
        price = item.quantity * (Product.find_by_id(item.product_id).price * (100-Discount.find_by(product_id: item.product.id).percent) / 100).round(2)
      else
        price = item.quantity * Product.find_by_id(item.product_id).price
      end
      @total += price
    end
    if @cart.products.empty?
      @products = []
      while @products.length<5
        temp = Product.all.sample
        @products << temp unless @products.include?(temp)
      end
    end
  end


  private
    def set_cart
      if session[:cart_id].present?
        @cart = Cart.find_by_id(session[:cart_id])
      else
        @cart = Cart.create(session_id: session[:session_id], total: 0.0)
        session[:cart_id] = @cart.id
      end
    end
end
