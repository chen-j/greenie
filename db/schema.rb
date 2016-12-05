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

ActiveRecord::Schema.define(version: 20161205222041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "players"
    t.string   "team"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "match_id"
    t.index ["match_id"], name: "index_match_events_on_match_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.string   "teamAName",                        null: false
    t.string   "teamBName",                        null: false
    t.integer  "teamAScore",  default: 0
    t.integer  "teamBScore",  default: 0
    t.string   "matchStatus", default: "upcoming", null: false
    t.string   "venue"
    t.string   "city"
    t.string   "firstRef"
    t.string   "secondRef"
    t.datetime "matchdate",                        null: false
    t.string   "competition"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "scorer_id"
    t.index ["scorer_id"], name: "index_matches_on_scorer_id", using: :btree
  end

  create_table "scorers", force: :cascade do |t|
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
    t.string   "school_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_scorers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_scorers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "match_events", "matches"
  add_foreign_key "matches", "scorers"
end
