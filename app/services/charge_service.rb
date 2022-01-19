# frozen_string_literal: true

class ChargeService < BaseCreditCardService
  def call
    find_credit_card
    return unless credit_card

    charge_card if can_charge?
  end

  private

  attr_reader :holder_name, :current_limit, :charge_amount, :credit_card

  def initialize(holder_name:, charge_amount:)
    @holder_name = holder_name
    @charge_amount = charge_amount
  end

  def can_charge?
    credit_card.card_valid? && credit_card.current_limit >= charge_amount
  end

  def charge_card
    credit_card.card_transactions.create!(debit: charge_amount)
  end
end
