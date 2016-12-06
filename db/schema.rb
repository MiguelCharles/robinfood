# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161206110226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "promotions", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.integer  "initial_quantity"
    t.string   "unit"
    t.integer  "initial_price_per_unit"
    t.integer  "price_after_promotion_per_unit"
    t.integer  "remaining_quantity"
    t.boolean  "promotion_status"
    t.integer  "digits_code"
    t.datetime "validity"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["shop_id"], name: "index_promotions_on_shop_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.text     "description"
    t.string   "phone_number"
    t.string   "VAT_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_shops_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "promotions", "shops"
  add_foreign_key "shops", "users"
end
