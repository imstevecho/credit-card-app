# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditService do
  context 'valid credit card' do
    it 'add fund to credit card' do
      credit_card = create(:credit_card, limit: 1000)
      CreditService.new(holder_name: credit_card.holder_name, credit_amount: 500).call

      expect(credit_card.card_transactions.count).to eq(1)
      expect(credit_card.current_balance).to eq(-500)
    end
  end

  context 'invalid credit card' do
    it 'add fund to credit card' do
      credit_card = create(:credit_card, card_number: 'invalid', limit: 1000)
      CreditService.new(holder_name: credit_card.holder_name, credit_amount: 500).call

      expect(credit_card.card_transactions.count).to eq(0)
      expect(credit_card.current_balance).to be_nil
    end
  end
end
