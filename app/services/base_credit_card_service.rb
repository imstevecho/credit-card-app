# frozen_string_literal: true

class BaseCreditCardService
  private

  def find_credit_card
    @credit_card = CreditCard.find_by(holder_name: holder_name)
  end
end
