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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131023190055) do

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "addr_line_1"
    t.string   "addr_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "dmv_number"
    t.string   "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "function"
  end

  create_table "recycler_redeemers", :force => true do |t|
    t.integer  "redeemer_id"
    t.integer  "recycler_id"
    t.string   "plastic"
    t.string   "glass"
    t.string   "cans"
    t.string   "other"
    t.datetime "selection_date"
    t.datetime "completion_date"
    t.integer  "rating"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "recyclers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "addr_line_1"
    t.string   "addr_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "user_id"
  end

  create_table "redeemers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "dmv_number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "user_id"
  end

  create_table "transactions", :force => true do |t|
    t.string   "recycler_user_id"
    t.string   "redeemer_user_id"
    t.string   "plastic"
    t.string   "glass"
    t.string   "cans"
    t.string   "other"
    t.datetime "selection_date"
    t.datetime "completion_date"
    t.integer  "rating"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "function"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
