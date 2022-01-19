# frozen_string_literal: true

class CreditService < BaseCreditCardService
  def initialize(holder_name:, credit_amount:)
    @holder_name = holder_name
    @credit_amount = credit_amount
  end

  def call
    find_credit_card
    process_credit_amount
  end

  private

  attr_reader :holder_name, :credit_amount, :credit_card

  def process_credit_amount
    credit_card.card_transactions.create!(credit: credit_amount) if credit_card&.card_valid?
  end
end
