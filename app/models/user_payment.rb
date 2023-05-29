# frozen_string_literal: true

# This is the UserPayment class
class UserPayment < ApplicationRecord
  belongs_to :user

  validates :payment_type, :provider, :account_number,
            presence: { message: I18n.t('activerecord.attributes.user_payment/payment_type.blank') }
  validate :validate_format, :validate_future_date

  def validate_format
    validate_expiry_digits
    validate_expiry_format
    validate_account_number_format
  end

  private

  def validate_expiry_digits
    errors.add(:expiry, 'Термін дії повинен містити цифри') if expiry.present? && contains_digits?(expiry)
  end

  def validate_expiry_format
    errors.add(:expiry, 'Введіть у форматі ММ/РР.') if expiry.present? && expiry.match?(/(\d{2})(\d{1,2})/)
  end

  def validate_account_number_format
    return unless account_number.present? && valid_iban?(account_number)

    errors.add(:account_number, 'Неправильний формат IBAN')
  end

  def valid_iban?(iban)
    stripped_iban = iban.gsub(/\s+/, '')
    iban_regex = /\AUA\d{2}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{2}\z/
    stripped_iban.match?(iban_regex)
  end

  def validate_future_date
    if expiry.present?
      expiry_date = Date.strptime(expiry, '%m/%y')
      if expiry_date < Date.current
        errors.add(:expiry, 'Введіть дату в майбутньому')
      elsif expiry_date > Date.current + 10.years
        errors.add(:expiry, 'Дата не може бути більше 10 років після поточної дати')
      end
    end
  rescue ArgumentError
    errors.add(:expiry, 'Неправильний формат (ММ/РР)')
  end

  def contains_digits?(string)
    string =~ %r{[^\d/]}
  end
end
