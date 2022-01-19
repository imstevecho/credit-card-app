# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_19_033532) do

  create_table "card_transactions", force: :cascade do |t|
    t.integer "credit_card_id"
    t.integer "debit"
    t.integer "credit"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_card_id"], name: "index_card_transactions_on_credit_card_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "holder_name", null: false
    t.string "card_number", null: false
    t.integer "limit", default: 0, null: false
    t.boolean "card_valid", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_number"], name: "index_credit_cards_on_card_number", unique: true
  end

end
