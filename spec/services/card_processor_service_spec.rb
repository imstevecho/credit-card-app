# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardProcessorService do
  let(:data) do
    <<~HEREDOC
      Add Tom 4111111111111111 $1000
      Add Lisa 5454545454545454 $3000
      Add Quincy 1234567890123456 $2000
      Charge Tom $500
      Charge Tom $800
      Charge Lisa $7
      Credit Lisa $100
      Credit Quincy $200
    HEREDOC
      .split("\n")
  end

  describe '#call' do
    it 'calculate card transactions' do
      CardProcessorService.new(data: data).call

      tom_card = CreditCard.find_by(holder_name: 'Tom')
      lisa_card = CreditCard.find_by(holder_name: 'Lisa')
      qunicy_card = CreditCard.find_by(holder_name: 'Quincy')

      expect(qunicy_card.card_valid?).to be false

      expect(tom_card.current_balance).to eq(500)
      expect(lisa_card.current_balance).to eq(-93)
      expect(qunicy_card.current_balance).to be_nil
    end
  end
end
