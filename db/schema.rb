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

ActiveRecord::Schema.define(version: 2020_02_02_114226) do

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
    t.string "contact_number"
    t.boolean "is_admin"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_city_sports", "level_city_sports", column: "level_city_sports_id"
end
