class CartController < ApplicationController
  before_action :set_cart, :set_product
  after_action :set_total, except: :show
  protect_from_forgery except: :show

  def add_product_to_cart
    @cart.products.append(@product) unless @cart.products.include?(@product)
  end

  def delete_product_from_cart
    @cart.products.delete(@product)
    redirect_to :action => "show"
  end

  def increase_product_quantity
    quantity = @cart.carts_products.find_by(product_id: @product.id).quantity
    @cart.carts_products.find_by(product_id: @product.id).update(quantity: quantity+1)
    redirect_to :action => "show"
  end

  def decrease_product_quantity
    quantity = @cart.carts_products.find_by(product_id: @product.id).quantity
    @cart.carts_products.find_by(product_id: @product.id).update(quantity: quantity-1)
    redirect_to :action => "show"
  end

  def show
    if @cart.products.empty?
      @products = Product.all.shuffle.first(5)
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

    def set_product
      @product = Product.find_by_id(params[:product_id])
    end

    def set_total
      @cart.update(total: @cart.carts_products.map {|item| item.quantity * item.product.get_current_price}.sum)
    end

end
