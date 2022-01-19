# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe 'Validation' do
    context 'invalid card' do
      it 'sets card_valid false' do
        subject.card_number = 'bad number'
        subject.holder_name = 'John'
        subject.limit = 1000
        subject.save

        expect(subject.card_valid).to be false
        expect(subject.current_balance).to be_nil
        expect(subject.current_limit).to eq(0)
      end
    end

    context 'valid card' do
      it 'sets card_valid false' do
        subject.card_number = '5454545454545454'
        subject.holder_name = 'John'
        subject.limit = 1000
        subject.save

        expect(subject.card_valid).to be true
        expect(subject.current_balance).to be_zero
        expect(subject.current_limit).to eq(1000)
      end
    end
  end
end
