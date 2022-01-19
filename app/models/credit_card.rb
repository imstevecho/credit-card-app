# frozen_string_literal: true

class CreditCard < ApplicationRecord
  has_many :card_transactions

  validates :holder_name, :card_number, :limit, presence: true
  after_validation :validate_card_number, on: %i[create update]

  def current_limit
    if card_valid?
      limit + (current_balance * -1)
    else
      0
    end
  end

  def current_balance
    card_transactions.sum(:debit) - card_transactions.sum(:credit) if card_valid?
  end

  private

  def validate_card_number
    self.card_valid = Luhn.valid?(card_number)
  end
end
