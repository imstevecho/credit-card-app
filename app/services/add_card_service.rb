# frozen_string_literal: true

class AddCardService < BaseCreditCardService
  attr_reader :holder_name, :card_number, :limit

  def initialize(holder_name:, card_number:, limit:)
    @holder_name = holder_name
    @card_number = card_number
    @limit = limit
  end

  def call
    CreditCard.create!(holder_name: holder_name, card_number: card_number, limit: limit)
  rescue ActiveRecord::RecordInvalid => e
    'Todo: Handle record invalid error'
  rescue ActiveRecord::RecordNotUnique => e
    'Todo: Handle record not unique error'
  end
end
