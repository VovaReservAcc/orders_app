# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_12_01_161559) do

  create_table "customers", force: :cascade do |t|
    t.text "properties"
    t.text "user"
    t.text "prefix"
    t.string "name"
  end

  create_table "goods", force: :cascade do |t|
    t.text "name"
    t.text "properties"
    t.float "count_in_pack"
  end

  create_table "goods_mappings", force: :cascade do |t|
    t.integer "good_id"
    t.integer "order_row_id"
  end

  create_table "order_rows", force: :cascade do |t|
    t.integer "order_id"
    t.integer "good_id"
    t.float "count"
    t.float "height"
    t.float "width"
    t.float "price"
    t.float "sum"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.text "number"
    t.date "date"
    t.float "sum"
    t.integer "id_other_app"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
