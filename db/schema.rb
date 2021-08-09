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

ActiveRecord::Schema.define(version: 20210807175731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.bigint "position_id"
    t.integer "rushing_attempts"
    t.float "rushing_attempts_per_game"
    t.integer "total_rushing_yards"
    t.float "average_rushing_yards_attempt"
    t.float "rushing_yards_per_game"
    t.integer "total_rushing_touchdowns"
    t.string "longest_rush"
    t.integer "rushing_first_downs"
    t.decimal "rushing_first_down_percentage"
    t.integer "rushing_twenty_yards"
    t.integer "rushing_forty_yards"
    t.integer "rushing_fumbles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
