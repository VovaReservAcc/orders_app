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

ActiveRecord::Schema.define(version: 2020_02_21_093202) do

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

end
