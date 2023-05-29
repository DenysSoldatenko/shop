# frozen_string_literal: true

# This is the User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wishlist_products
  has_many :user_address
  has_many :user_payment

  validates :name, :surname, :patronymic, :email, presence: true
  validate :validate_name_format
  validates :password, presence: true, length: { minimum: 6, maximum: 128 }, allow_blank: true, on: :update

  def validate_name_format
    validate_name_contains_digits
    validate_surname_contains_digits
    validate_patronymic_contains_digits
    validate_name_length
    validate_surname_length
    validate_patronymic_length
    validate_email_format
  end

  private

  def validate_name_contains_digits
    errors.add(:name, "Ім'я не повинно містити цифр") if name.present? && contains_digits?(name)
  end

  def validate_surname_contains_digits
    errors.add(:surname, 'Прізвище не повинно містити цифр') if surname.present? && contains_digits?(surname)
  end

  def validate_patronymic_contains_digits
    return unless patronymic.present? && contains_digits?(patronymic)

    errors.add(:patronymic, 'По-батькові не повинно містити цифр')
  end

  def validate_name_length
    errors.add(:name, "Ім'я дуже довге (максимум 25 символів)") if name&.length.to_i > 25
  end

  def validate_surname_length
    errors.add(:surname, 'Прізвище дуже довге (максимум 25 символів)') if surname&.length.to_i > 25
  end

  def validate_patronymic_length
    errors.add(:patronymic, 'По-батькові дуже довге (максимум 25 символів)') if patronymic&.length.to_i > 25
  end

  def validate_email_format
    return unless email.present? && !valid_email_format?

    errors.add(:email, 'Неправильний формат пошти')
  end

  def valid_email_format?
    email.present? && email.match?(URI::MailTo::EMAIL_REGEXP)
  end

  def contains_digits?(string)
    string =~ /\d/
  end
end
