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

ActiveRecord::Schema.define(version: 20150209022402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name",               null: false
    t.text   "description",        null: false
    t.string "font_awesome_image", null: false
  end

  create_table "listing_amenities", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "amenity_id", null: false
  end

  create_table "listing_types", force: :cascade do |t|
    t.string "title",       null: false
    t.text   "description", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title",           null: false
    t.text     "description"
    t.string   "address",         null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.string   "zip_code",        null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "header_image"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "weekly_rate"
    t.integer  "listing_type_id", null: false
  end

  add_index "listings", ["latitude", "longitude"], name: "index_listings_on_latitude_and_longitude", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.date    "start_date",             null: false
    t.date    "end_date",               null: false
    t.integer "user_id",                null: false
    t.integer "listing_id",             null: false
    t.integer "total_cost", default: 0
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "overall_rating",     null: false
    t.text     "comment"
    t.integer  "listing_id",         null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amenities_rating"
    t.integer  "cleanliness_rating"
    t.integer  "location_rating"
    t.integer  "company_rating"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
