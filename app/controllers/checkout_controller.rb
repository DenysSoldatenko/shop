class CheckoutController < ApplicationController
  def index
    @cart = Cart.find_by(id: session[:cart_id])
    @total = session[:total]
    @user_address = UserAddress.new
    @user_payment = UserPayment.new
  end

  def history
    @user = current_user
    @purchases = Purchase.where(user_id: current_user.id)
  end

  def success
    @cart = Cart.find_by(id: session[:cart_id])
    @total = session[:total]
    @cart.carts_products.map { |carts_product| carts_product.delete }
    @total = nil
  end

  def create
    @user_address = UserAddress.new(user_address_params)
    @user_payment = UserPayment.new(user_payment_params)
    @user_address.valid?
    @user_payment.valid?
    puts @user_address.errors.full_messages
    puts @user_payment.errors.full_messages
    if valid_user_information?
      save_user_information
      redirect_to success_path, notice: "Дані успішно оновлено."
    else
      handle_validation_error
    end
  end

  private

  def user_address_params
    params.require(:user_address).permit(:address, :city, :zip_code, :phone_number).merge(user_id: current_user.id)
  end

  def user_payment_params
    params.require(:user_payment).permit(:payment_type, :provider, :account_number, :expiry).merge(user_id: current_user.id)
  end

  def valid_user_information?
    @user_address.valid? && @user_payment.valid?
  end

  def save_user_information
    @cart = Cart.find_by(id: session[:cart_id])
    @user = current_user
    @cart.carts_products.each do |carts_product|
      product = carts_product.product
      Purchase.create(quantity: carts_product.quantity, date: Date.today,
                      price: product.price, product_id: product.id, user_id:current_user.id)
    end
    @user_address.save
    @user_payment.save
  end

  def handle_validation_error
    @cart = Cart.find_by(id: session[:cart_id])
    @total = session[:total]
    flash.now[:alert] = "Помилка при оновленні інформації."
    render :index
  end
end