# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommandProcessor do
  describe '#call' do
    it 'calls AddCardService' do
      add_card_instance = double('AddCardService', call: nil)
      allow(AddCardService).to receive(:new).and_return(add_card_instance)

      CommandProcessor.new('Add Tom 4111111111111111 $1000').call

      expect(AddCardService).to have_received(:new).with({
                                                           holder_name: 'Tom',
                                                           card_number: '4111111111111111',
                                                           limit: 1000
                                                         })
    end

    it 'calls ChargeService' do
      charge_service_instance = double('ChargeService', call: nil)
      allow(ChargeService).to receive(:new).and_return(charge_service_instance)

      CommandProcessor.new('Charge Tom $500').call

      expect(ChargeService).to have_received(:new).with({
                                                          holder_name: 'Tom',
                                                          charge_amount: 500
                                                        })
    end

    it 'calls CreditService' do
      charge_service_instance = double('CreditService', call: nil)
      allow(CreditService).to receive(:new).and_return(charge_service_instance)

      CommandProcessor.new('Credit Lisa $100').call

      expect(CreditService).to have_received(:new).with({
                                                          holder_name: 'Lisa',
                                                          credit_amount: 100
                                                        })
    end
  end
end
