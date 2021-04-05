# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_05_150704) do

  create_table "increase_points", force: :cascade do |t|
    t.string "date"
    t.string "winner1"
    t.string "winner2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  create_table "match_predections", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "winners1"
    t.string "winners2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  create_table "winner_teams_users", force: :cascade do |t|
    t.string "date"
    t.string "winners1"
    t.string "winners2"
    t.string "team1"
    t.string "team2"
    t.string "match1"
    t.string "match2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
