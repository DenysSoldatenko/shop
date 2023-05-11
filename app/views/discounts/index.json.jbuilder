# frozen_string_literal: true

json.array! @discounts, partial: 'discounts/discount', as: :discount
