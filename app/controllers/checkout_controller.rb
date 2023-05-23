# frozen_string_literal: true

# This is the CheckoutController class
class CheckoutController < ApplicationController
  before_action :set_cart, only: %i[index success create]

  def index
    @user_address = UserAddress.new
    @user_payment = UserPayment.new
  end

  def history
    @user = current_user
    @purchases = Purchase.where(user_id: current_user.id)

  end

  def success
    @cart.carts_products.map(&:delete)
    @total = nil
  end

  def create
    @user_address = UserAddress.new(user_address_params)
    @user_payment = UserPayment.new(user_payment_params)
    if valid_user_information?
      save_user_information
      redirect_to success_path
    else
      handle_validation_error
    end
  end

  private

  def user_address_params
    params.require(:user_address).permit(:address, :city, :zip_code, :phone_number)
          .merge(user_id: current_user.id)
  end

  def user_payment_params
    params.require(:user_payment).permit(:payment_type, :provider, :account_number, :expiry)
          .merge(user_id: current_user.id)
  end

  def valid_user_information?
    valid = @user_address.valid? && @user_payment.valid?
    @user_address.valid?
    @user_payment.valid?
    unless valid
      Rails.logger.debug @user_address.errors.full_messages
      Rails.logger.debug @user_payment.errors.full_messages
    end

    valid
  end

  def save_user_information
    @user = current_user
    @cart.carts_products.each do |carts_product|
      product = carts_product.product
      Purchase.create(quantity: carts_product.quantity, date: Time.zone.today,
                      price: product.price, product_id: product.id, user_id: current_user.id)
    end
    @user_address.save
    @user_payment.save
  end

  def handle_validation_error
    flash.now[:alert] = 'Помилка при оновленні інформації.'
    render :index
  end

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])
    @total = @cart.total
  end
end
