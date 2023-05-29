# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'John',
      surname: 'Doe',
      patronymic: 'Smith',
      email: 'john.doe@example.com',
      encrypted_password: Devise::Encryptor.digest(User, 'password33')
    )
  end

  test 'should be valid with valid attributes' do
    @user.password = 'password123'
    assert @user.valid?
  end

  test 'should not be valid without a name' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'should not be valid without a surname' do
    @user.surname = nil
    assert_not @user.valid?
  end

  test 'should not be valid without a patronymic' do
    @user.patronymic = nil
    assert_not @user.valid?
  end

  test 'should not be valid without an email' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'should not be valid with a name containing digits' do
    @user.name = 'John123'
    assert_not @user.valid?
  end

  test 'should not be valid with a surname containing digits' do
    @user.surname = 'Doe456'
    assert_not @user.valid?
  end

  test 'should not be valid with a patronymic containing digits' do
    @user.patronymic = 'Smith789'
    assert_not @user.valid?
  end

  test 'should not be valid with a long name' do
    @user.name = 'a' * 26
    assert_not @user.valid?
  end

  test 'should not be valid with a long surname' do
    @user.surname = 'a' * 26
    assert_not @user.valid?
  end

  test 'should not be valid with a long patronymic' do
    @user.patronymic = 'a' * 26
    assert_not @user.valid?
  end

  test 'should not be valid with an invalid email format' do
    @user.email = 'john@example'
    assert_not @user.valid?
  end

  test 'should not be valid with a long password on update' do
    @user.password = 'a' * 129
    assert_not @user.valid?(:update)
  end
end
