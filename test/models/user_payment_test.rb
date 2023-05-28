# frozen_string_literal: true

require 'test_helper'

class UserPaymentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John Doe')
    @payment = UserPayment.new(
      user: @user,
      payment_type: 'Карта',
      provider: 'Самовивіз',
      account_number: 'UA50 8648 7224 7166 6927 9229 321 24',
      expiry: '12/25'
    )
  end

  test 'should be valid with valid attributes' do
    assert @payment.valid?
  end

  test 'should not be valid without a payment type' do
    @payment.payment_type = nil
    assert_not @payment.valid?
  end

  test 'should not be valid without a provider' do
    @payment.provider = nil
    assert_not @payment.valid?
  end

  test 'should not be valid without an account number' do
    @payment.account_number = nil
    assert_not @payment.valid?
  end

  test 'should have a valid expiry date format' do
    @payment.expiry = '12/2025'
    assert_not @payment.valid?
  end

  test 'should have a valid account number format' do
    @payment.account_number = nil
    assert_not @payment.valid?
  end

  test 'should have a future expiry date' do
    @payment.expiry = '12/20'
    assert_not @payment.valid?
  end

  test 'should have an expiry date within 10 years' do
    @payment.expiry = '12/35'
    assert_not @payment.valid?
  end
end
