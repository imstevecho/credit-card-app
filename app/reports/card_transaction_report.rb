# frozen_string_literal: true

class CardTransactionReport
  attr_reader :credit_cards

  def generate_report
    get_credit_cards
    print_balance
  end

  private

  def get_credit_cards
    @credit_cards = CreditCard.includes(:card_transactions).order(:holder_name)
  end

  def print_balance
    @credit_cards.each do |card|
      puts "#{card.holder_name}: #{display_balance(card.current_balance)}"
    end
  end

  def display_balance(balance)
    if balance
      "$#{balance}"
    else
      'error'
    end
  end
end
