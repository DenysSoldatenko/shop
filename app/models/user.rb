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

  validates :name, :surname, :patronymic, presence: true
  validate :validate_name_format
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 128 }
  def validate_name_format
    if name.present? && contains_digits?(name)
      errors.add(:name, "Ім'я не повинно містити цифр")
    end

    if surname.present? && contains_digits?(surname)
      errors.add(:surname, "Прізвище не повинно містити цифр")
    end

    if patronymic.present? && contains_digits?(patronymic)
      errors.add(:patronymic, "По-батькові не повинно містити цифр")
    end

    if name&.length.to_i > 25
      errors.add(:name, "Ім'я дуже довге (максимум 25 символів)")
    end

    if surname&.length.to_i > 25
      errors.add(:surname, "Прізвище дуже довге (максимум 25 символів)")
    end

    if patronymic&.length.to_i > 25
      errors.add(:patronymic, "По-батькові дуже довге (максимум 25 символів)")
    end
  end

  def contains_digits?(string)
    string =~ /\d/
  end
end
