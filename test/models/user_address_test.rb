# frozen_string_literal: true

require 'test_helper'

class UserAddressTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John Doe')
    @address = UserAddress.new(
      user: @user,
      address: 'вул. Миргородська, 23',
      city: 'Авдіївка',
      zip_code: '12345',
      phone_number: '1234567890'
    )
  end

  test 'should be valid with valid attributes' do
    assert @address.valid?
  end

  test 'should not be valid without an address' do
    @address.address = nil
    assert_not @address.valid?
  end

  test 'should not be valid without a city' do
    @address.city = nil
    assert_not @address.valid?
  end

  test 'should not be valid without a zip code' do
    @address.zip_code = nil
    assert_not @address.valid?
  end

  test 'should not be valid without a phone number' do
    @address.phone_number = nil
    assert_not @address.valid?
  end

  test 'should have a valid address format' do
    @address.address = 'Invalid Address'
    assert_not @address.valid?
  end

  test 'should have a valid city format' do
    @address.city = '123 City'
    assert_not @address.valid?
  end

  test 'should have a valid city within Ukraine' do
    @address.city = 'Харків'
    assert @address.valid?
  end

  test 'should not contain digits in the city name' do
    @address.city = 'Харків123'
    assert_not @address.valid?
  end

  test 'should have a valid zip code format' do
    @address.zip_code = 'Invalid Zip Code'
    assert_not @address.valid?
  end

  test 'should have a valid phone number format' do
    @address.phone_number = 'Invalid Phone Number'
    assert_not @address.valid?
  end
end
