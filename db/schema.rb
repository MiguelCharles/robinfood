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

ActiveRecord::Schema.define(version: 20170103234116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "quantity_ordered"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.string   "product_type"
    t.integer  "initial_quantity"
    t.string   "unit"
    t.float    "initial_price_per_unit"
    t.float    "price_after_promotion_per_unit"
    t.integer  "remaining_quantity"
    t.boolean  "promotion_status"
    t.integer  "digits_code"
    t.datetime "validity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_quantity"
    t.string   "description"
    t.string   "photo_url"
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name_of_the_store"
    t.string   "category"
    t.text     "description"
    t.string   "phone_number"
    t.string   "VAT_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "address"
    t.string   "picture_of_the_shop"
    t.integer  "street_number"
    t.string   "photo_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "orders", "promotions"
  add_foreign_key "orders", "users"
  add_foreign_key "promotions", "shops"
  add_foreign_key "shops", "users"
end
