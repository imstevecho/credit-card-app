# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChargeService do
  let(:credit_card) { create(:credit_card, limit: 1000) }

  describe '#call' do
    context 'when have enough limit' do
      it 'successfully charge' do
        ChargeService.new(holder_name: credit_card.holder_name, charge_amount: 500).call
        expect(credit_card.current_balance).to eq(500)
      end
    end

    context 'when have smaller limit' do
      it 'successfully charge' do
        ChargeService.new(holder_name: credit_card.holder_name, charge_amount: 200).call
        expect(credit_card.current_balance).to eq(200)
      end
    end

    context 'multiple transactions' do
      it 'successfully charge until limit reached' do
        ChargeService.new(holder_name: credit_card.holder_name, charge_amount: 500).call
        ChargeService.new(holder_name: credit_card.holder_name, charge_amount: 800).call
        expect(credit_card.card_transactions.count).to eq(1)
        expect(credit_card.current_balance).to eq(500)
      end
    end

    context 'invalid card' do
      it 'can not charge' do
        invalid_card = create(:credit_card, card_number: 'invalid', limit: 1000)

        ChargeService.new(holder_name: invalid_card.holder_name, charge_amount: 500).call
        expect(credit_card.card_transactions.count).to eq(0)
      end
    end
  end
end
