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

ActiveRecord::Schema.define(version: 20161025040514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "tag"
    t.string   "photoable_type"
    t.integer  "photoable_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "category"
    t.string   "status"
    t.string   "name"
    t.string   "number"
    t.string   "unit"
    t.string   "price"
    t.string   "start_volume"
    t.string   "volume"
    t.string   "brand"
    t.string   "spec"
    t.string   "mark"
    t.string   "image"
    t.string   "roles"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "attachment"
    t.text     "other"
    t.integer  "origin_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "category"
    t.string   "area"
    t.string   "address"
    t.string   "contact_name"
    t.string   "contact_title"
    t.string   "mobile"
    t.string   "telephone"
    t.string   "fax"
    t.string   "qq"
    t.string   "image"
    t.string   "roles"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "attachment"
    t.text     "company_information"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "password"
    t.string   "mobile"
    t.boolean  "admin",           default: false
    t.string   "roles"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "auth_token"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
