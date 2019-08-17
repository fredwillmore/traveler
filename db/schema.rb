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

ActiveRecord::Schema.define(version: 2016_12_03_112013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentication_tokens", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "user_id"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "challenge_translations", force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "challenge_text"
    t.index ["challenge_id"], name: "index_challenge_translations_on_challenge_id"
    t.index ["locale"], name: "index_challenge_translations_on_locale"
  end

  create_table "challenge_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_types_challenges", id: :serial, force: :cascade do |t|
    t.integer "challenge_type_id"
    t.integer "challenge_id"
  end

  create_table "challenges", id: :serial, force: :cascade do |t|
    t.integer "challenge_type_id"
    t.integer "curriculum_area_id"
    t.integer "level"
    t.text "challenge_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_area_translations", force: :cascade do |t|
    t.integer "curriculum_area_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["curriculum_area_id"], name: "index_curriculum_area_translations_on_curriculum_area_id"
    t.index ["locale"], name: "index_curriculum_area_translations_on_locale"
  end

  create_table "curriculum_areas", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.integer "item_type_id"
    t.integer "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 7
    t.decimal "lng", precision: 10, scale: 7
    t.string "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_type_data", id: :serial, force: :cascade do |t|
    t.integer "place_type_id"
    t.string "data_type"
    t.float "score"
    t.float "cost"
    t.float "cost_multiplier"
  end

  create_table "place_type_translations", force: :cascade do |t|
    t.integer "place_type_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.index ["locale"], name: "index_place_type_translations_on_locale"
    t.index ["place_type_id"], name: "index_place_type_translations_on_place_type_id"
  end

  create_table "place_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_types_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "place_type_id"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "external_id"
    t.integer "player_id"
    t.integer "location_id"
    t.float "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_quantities", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "quantity_id"
    t.float "value"
    t.float "max_value"
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "state"
    t.integer "location_id"
    t.integer "destination_id"
    t.integer "level"
    t.string "name"
    t.string "sex"
    t.datetime "dob"
    t.string "occupation"
    t.integer "attractiveness"
    t.integer "charisma"
    t.integer "status"
    t.integer "intelligence"
    t.integer "luck"
    t.string "base_locale"
    t.string "target_locale"
    t.string "target_dialect"
    t.boolean "is_current_player"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "quantities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.float "value"
  end

  create_table "reward_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_suggestions", id: :serial, force: :cascade do |t|
    t.string "term"
    t.integer "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_actions", id: :serial, force: :cascade do |t|
    t.integer "action_type_id"
    t.integer "reward_id"
    t.integer "risk_id"
    t.integer "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "authentication_tokens", "users"
end
