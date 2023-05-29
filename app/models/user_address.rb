# frozen_string_literal: true

require 'yaml'
# This is the UserAddress class
class UserAddress < ApplicationRecord
  belongs_to :user

  validates :address, :city, :zip_code, :phone_number, presence: true
  validate :validate_format

  def validate_format
    validate_address_format
    validate_city_format
    validate_zip_code_format
    validate_phone_number_format
  end

  def contains_digits?(string)
    string =~ /\d/
  end

  def self.ukrainian_cities
    @ukrainian_cities ||= YAML.load_file('db/ukrainian_cities.yaml')
  end

  def in_ukraine?(city)
    self.class.ukrainian_cities.include?(city)
  end

  private

  def validate_address_format
    return unless address.present? && !address.match?(/\A(?:пров\.|вул\.|пл\.|просп\.) [а-яА-ЯіІїЇєЄёЁ',\s]+, \d+\z/)

    errors.add(:address, 'Неправильний формат адреси')
  end

  def validate_city_format
    return if city.blank?

    errors.add(:city, 'Місто не повинно містити цифр') if contains_digits?(city)
    errors.add(:city, 'Місто повинно бути в Україні') unless in_ukraine?(city)
    errors.add(:city, 'Місто дуже довге (максимум 25 символів)') if city.length.to_i > 25
  end

  def validate_zip_code_format
    return unless zip_code.present? && zip_code !~ /\A\d{5}\z/

    errors.add(:zip_code, 'Поштовий код повинен містити лише цифри')
  end

  def validate_phone_number_format
    return unless phone_number.present? && (!phone_number.match?(/(?=.*\+[0-9]{3}\s?[0-9]{2}\s?[0-9]{3}\s?[0-9]{4,5}$)/))

    errors.add(:phone_number, 'Телефонний номер має бути записаний у правильному форматі')
  end
end
