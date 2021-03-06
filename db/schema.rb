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

ActiveRecord::Schema.define(version: 20151209084900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heartbeats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "log_time"
    t.text     "log_data"
    t.string   "language"
    t.boolean  "is_write"
    t.integer  "num_lines"
    t.string   "entity"
    t.string   "project"
    t.string   "branch"
    t.string   "log_type"
  end

  add_index "heartbeats", ["log_time"], name: "index_heartbeats_on_log_time", using: :btree

end
