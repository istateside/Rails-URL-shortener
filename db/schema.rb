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

ActiveRecord::Schema.define(version: 20140924204037) do

  create_table "shortened_urls", force: true do |t|
    t.text     "long_url"
    t.text     "short_url"
    t.integer  "submitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["short_url"], name: "index_shortened_urls_on_short_url", unique: true
  add_index "shortened_urls", ["submitter_id"], name: "index_shortened_urls_on_submitter_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x007fe79c0c6288>"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: true do |t|
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "url_id"
  end

  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id"

end
