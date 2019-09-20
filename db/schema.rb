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

ActiveRecord::Schema.define(version: 20160516061340) do

  create_table "countries", force: true do |t|
    t.integer  "visitor_id"
    t.string   "name"
    t.integer  "num_v",                 null: false
    t.string   "datev",      limit: 50, null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "establishments", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "international_visitor_infors", force: true do |t|
    t.string   "africa"
    t.string   "asia"
    t.string   "america"
    t.string   "europe"
    t.integer  "visitor_info_id"
    t.string   "rdate",           limit: 100, null: false
    t.integer  "user_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "num_visitors", force: true do |t|
    t.integer  "visitor_infor_id"
    t.integer  "numv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.string   "name"
    t.decimal  "cost",             precision: 10, scale: 2
    t.string   "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partnerships", force: true do |t|
    t.string   "partnership"
    t.integer  "nump"
    t.string   "citizen"
    t.integer  "user_id"
    t.string   "rdate"
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reasons", force: true do |t|
    t.string   "reason"
    t.integer  "nump"
    t.string   "citizen"
    t.integer  "user_id"
    t.string   "rdate",      limit: 100, null: false
    t.integer  "visitor_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swazi_visitor_infos", force: true do |t|
    t.string   "place_of_residence"
    t.integer  "visitor_infor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transports", force: true do |t|
    t.string   "trans"
    t.integer  "nump"
    t.string   "citizen"
    t.integer  "user_id"
    t.string   "rdate"
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "surname"
    t.string   "role"
    t.string   "establishment_id"
    t.string   "unique_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitor_infos", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "date_of_arrival"
    t.string   "reason_for_vist"
    t.string   "mode_of_transport"
    t.string   "gender"
    t.string   "male"
    t.string   "female"
    t.string   "travel"
    t.string   "partner"
    t.string   "citizenship"
    t.string   "country"
    t.integer  "user_id"
    t.string   "Below_18"
    t.string   "age18_24"
    t.string   "age25_34"
    t.string   "age35_44"
    t.string   "age45_54"
    t.string   "age55_64"
    t.string   "age65"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitor_packages", force: true do |t|
    t.integer  "visitor_infor_id"
    t.integer  "package_id"
    t.integer  "num_visitor",                  null: false
    t.string   "rdate",            limit: 100, null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
