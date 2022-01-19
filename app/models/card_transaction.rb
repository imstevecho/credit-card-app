# frozen_string_literal: true

class CardTransaction < ApplicationRecord
  belongs_to :credit_card
end
