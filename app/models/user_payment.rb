class UserPayment < ApplicationRecord
  belongs_to :user

  validates :payment_type, :provider, :account_number, presence: { message: "Поле не може бути порожнім" }
  validate :validate_format, :validate_future_date

  def validate_format
    if expiry.present? && contains_digits?(expiry)
      errors.add(:expiry, "Термін дії повинен містити цифри")
    end

    if expiry.present? && expiry.match?(/(\d{2})(\d{1,2})/)
      errors.add(:expiry, "Введіть у форматі ММ/РР.")
    end

    if account_number.present? && valid_iban?(account_number)
      errors.add(:account_number, "Неправильний формат IBAN")
    end
  end

  def valid_iban?(iban)
    stripped_iban = iban.gsub(/\s+/, "")
    iban_regex = /\A[A-Z]{2}\d{2}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{4}\s?\d{2}\z/
    stripped_iban.match?(iban_regex)
  end

  def validate_future_date
    if expiry.present?
      expiry_date = Date.strptime(expiry, "%m/%y")
      if expiry_date < Date.current
        errors.add(:expiry, "Введіть дату в майбутньому")
      elsif expiry_date > Date.current + 10.years
        errors.add(:expiry, "Дата не може бути більше 10 років після поточної дати")
      end
    end
  rescue ArgumentError
    errors.add(:expiry, "Неправильний формат (ММ/РР)")
  end

  def contains_digits?(string)
    string =~ /[^\d\/]/
  end
end