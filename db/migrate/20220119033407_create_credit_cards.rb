# frozen_string_literal: true

class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.string :holder_name, null: false
      t.string :card_number, null: false
      t.integer :limit, default: 0, null: false
      t.boolean :card_valid, default: false, null: false
      t.timestamps
    end

    add_index :credit_cards, :card_number, unique: true
  end
end
