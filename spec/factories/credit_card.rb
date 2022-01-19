# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    card_number { '5454545454545454' }
    holder_name { 'Joe' }
    limit { 1000 }
  end
end
