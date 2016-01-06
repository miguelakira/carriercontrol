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

ActiveRecord::Schema.define(version: 20160106150358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "plate"
    t.string   "model"
    t.integer  "buyer_id"
    t.string   "buyer_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "delivery_status"
    t.date     "expected_end_date"
    t.date     "purchase_date"
    t.date     "delivery_date"
    t.string   "observation"
  end

  add_index "cars", ["buyer_type", "buyer_id"], name: "index_cars_on_buyer_type_and_buyer_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "capital"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "name"
    t.string   "cnpj"
    t.string   "legal_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "observation"
  end

  create_table "freights", force: :cascade do |t|
    t.decimal  "subtotal",             precision: 8, scale: 2
    t.decimal  "ferry",                precision: 8, scale: 2
    t.decimal  "platform",             precision: 8, scale: 2
    t.decimal  "redispatching",        precision: 8, scale: 2
    t.decimal  "platform_origin",      precision: 8, scale: 2
    t.decimal  "platform_destination", precision: 8, scale: 2
    t.string   "observation"
    t.integer  "car_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "freights", ["car_id"], name: "index_freights_on_car_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "observation"
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "current_location_id"
    t.integer  "car_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "routes", ["car_id"], name: "index_routes_on_car_id", using: :btree
  add_index "routes", ["current_location_id"], name: "index_routes_on_current_location_id", using: :btree
  add_index "routes", ["destination_id"], name: "index_routes_on_destination_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
