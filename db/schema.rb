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

ActiveRecord::Schema.define(version: 2022_09_05_071204) do

  create_table "fixed_costs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_fixed_costs_on_user_id"
  end

  create_table "money_boxes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_money_boxes_on_user_id"
  end

  create_table "pay_futures", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "price"
    t.date "pay_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pay_futures_on_user_id"
  end

  create_table "payeds", charset: "utf8mb4", force: :cascade do |t|
    t.integer "money_box_id"
    t.string "name"
    t.string "price"
    t.date "payed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "fixed_costs", "users"
  add_foreign_key "money_boxes", "users"
  add_foreign_key "pay_futures", "users"
end
