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

ActiveRecord::Schema.define(version: 20150528201324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grounds", force: :cascade do |t|
    t.text     "address"
    t.text     "name"
    t.text     "image"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grounds", ["match_id"], name: "index_grounds_on_match_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "date"
    t.string   "status"
    t.integer  "team_a_score"
    t.integer  "team_b_score"
    t.integer  "team_a_id"
    t.integer  "team_b_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "players", force: :cascade do |t|
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

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "hometown"
    t.string   "wins"
    t.string   "losses"
    t.string   "draws"
    t.integer  "rating"
    t.boolean  "seeking_players"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
