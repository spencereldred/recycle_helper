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

ActiveRecord::Schema.define(:version => 20151030164258) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "promo_code"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "recycler_user_id"
    t.integer  "redeemer_user_id"
    t.integer  "group_id"
    t.datetime "selection_date"
    t.datetime "completion_date"
    t.integer  "rating"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.boolean  "selected"
    t.boolean  "completed"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "plastic"
    t.integer  "cans"
    t.integer  "glass"
    t.integer  "other"
    t.boolean  "cardboard",        :default => false
    t.boolean  "non_hi5_plastic",  :default => false
    t.boolean  "non_hi5_glass",    :default => false
    t.boolean  "non_hi5_cans",     :default => false
    t.boolean  "magazines",        :default => false
    t.boolean  "newspaper",        :default => false
    t.boolean  "paper",            :default => false
    t.string   "trans_type"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "function"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "group_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "radius",          :default => 8
  end

end
