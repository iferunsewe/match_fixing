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

ActiveRecord::Schema.define(version: 20160203230146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grounds", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "date"
    t.boolean  "status",           default: false
    t.integer  "team_a_score",     default: 0
    t.integer  "team_b_score",     default: 0
    t.integer  "team_a_id"
    t.integer  "team_b_id"
    t.integer  "ground_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "man_of_the_match"
    t.integer  "league_id"
  end

  add_index "matches", ["ground_id"], name: "index_matches_on_ground_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.date     "dob"
    t.string   "position"
    t.string   "hometown"
    t.boolean  "captain",                default: false
    t.float    "weight"
    t.float    "height"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foot"
    t.boolean  "admin"
    t.text     "image"
    t.integer  "league_id"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "players_specialities", force: :cascade do |t|
    t.integer "player_id"
    t.integer "speciality_id"
  end

  add_index "players_specialities", ["player_id"], name: "index_players_specialities_on_player_id", using: :btree
  add_index "players_specialities", ["speciality_id"], name: "index_players_specialities_on_speciality_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.integer "player_id"
    t.string  "provider"
    t.string  "uid"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "stars",      default: 0
    t.integer  "rater"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "comment"
  end

  add_index "ratings", ["player_id"], name: "index_ratings_on_player_id", using: :btree
  add_index "ratings", ["team_id"], name: "index_ratings_on_team_id", using: :btree

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.boolean  "appearance",       default: true
    t.integer  "goals",            default: 0
    t.boolean  "man_of_the_match", default: false
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "stats", ["match_id"], name: "index_stats_on_match_id", using: :btree
  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "hometown"
    t.string   "primary_kit_colour"
    t.string   "secondary_kit_colour"
    t.integer  "played",               default: 0
    t.integer  "wins",                 default: 0
    t.integer  "losses",               default: 0
    t.integer  "draws",                default: 0
    t.integer  "points",               default: 0
    t.integer  "rating_id"
    t.boolean  "seeking_players"
    t.integer  "league_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "philosophy"
    t.text     "image"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  add_foreign_key "ratings", "players"
  add_foreign_key "ratings", "teams"
end
