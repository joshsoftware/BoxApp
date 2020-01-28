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

ActiveRecord::Schema.define(version: 2020_01_27_095835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_sports", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "sport_id"
    t.integer "number_of_boxes"
    t.integer "number_of_players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_sports_on_city_id"
    t.index ["sport_id"], name: "index_city_sports_on_sport_id"
  end

  create_table "level_city_sports", force: :cascade do |t|
    t.bigint "level_id"
    t.bigint "city_sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_sport_id"], name: "index_level_city_sports_on_city_sport_id"
    t.index ["level_id"], name: "index_level_city_sports_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "city_sport_id"
    t.date "played_on"
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_sport_id"], name: "index_matches_on_city_sport_id"
  end

  create_table "matches_users", id: false, force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "user_id"
    t.index ["match_id"], name: "index_matches_users_on_match_id"
    t.index ["user_id"], name: "index_matches_users_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_city_sports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "city_sport_id"
    t.integer "monthly_points"
    t.integer "total_points"
    t.boolean "is_waiting"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_city_sports_id"
    t.index ["city_sport_id"], name: "index_user_city_sports_on_city_sport_id"
    t.index ["level_city_sports_id"], name: "index_user_city_sports_on_level_city_sports_id"
    t.index ["user_id"], name: "index_user_city_sports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "contact_number"
    t.boolean "role"
    t.string "email"
    t.string "password_digest"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "user_city_sports", "level_city_sports", column: "level_city_sports_id"
end
