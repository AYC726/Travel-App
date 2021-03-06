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

ActiveRecord::Schema.define(version: 20131211204145) do

  create_table "activities", force: true do |t|
    t.string   "type_of_activity"
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.string   "price"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "depart_date"
    t.string   "return_date"
    t.string   "flying_from"
    t.string   "flying_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "lodgings", force: true do |t|
    t.string   "type_of_lodging"
    t.float    "price"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.string   "price"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "duration"
    t.integer  "location_id"
    t.float    "budget"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
