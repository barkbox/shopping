# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170925145848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sku"
    t.string   "type"
  end

  create_table "shopping_cart_purchases", force: :cascade do |t|
    t.integer  "cart_id"
    t.time     "succeeded_at"
    t.time     "failed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "purchased_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "origin"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.jsonb    "meta"
  end

  add_index "shopping_carts", ["origin"], name: "index_shopping_carts_on_origin", using: :btree

  create_table "shopping_line_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "quantity"
    t.decimal  "list_price"
    t.decimal  "sale_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.jsonb    "meta"
  end

end
