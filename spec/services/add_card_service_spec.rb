# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddCardService do
  describe '#call' do
    context 'when valid card number passed' do
      it 'creates a valid card' do
        params = { holder_name: 'John', card_number: '4111111111111111', limit: '$1000' }
        expect do
          AddCardService.new(**params).call
        end.to change { CreditCard.count }.by(1)

        expect(CreditCard.first.card_valid?).to be true
      end
    end

    context 'when invalid card number passed' do
      it 'creates an invalid card' do
        params = { holder_name: 'Paul', card_number: 'invalid', limit: '$1000' }
        expect do
          AddCardService.new(**params).call
        end.to change { CreditCard.count }.by(1)

        expect(CreditCard.first.card_valid?).to be false
      end
    end
  end
end
