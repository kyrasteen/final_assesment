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

ActiveRecord::Schema.define(version: 20150624065111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.string "title"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "programmer1_id"
    t.integer "programmer2_id"
  end

  create_table "potential_pairs", force: :cascade do |t|
    t.integer "requested_id"
    t.integer "requester_id"
    t.boolean "accepted",     default: false
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "image_url"
    t.string "email"
    t.text   "about"
  end

end
