# frozen_string_literal: true

class CreateCardTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :card_transactions do |t|
      t.references :credit_card
      t.integer :debit
      t.integer :credit
      t.integer :amount

      t.timestamps
    end
  end
end
