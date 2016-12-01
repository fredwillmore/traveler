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

ActiveRecord::Schema.define(version: 20161201112127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_translations", force: :cascade do |t|
    t.integer  "challenge_id",               null: false
    t.string   "locale",         limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "challenge_text"
    t.index ["challenge_id"], name: "index_challenge_translations_on_challenge_id", using: :btree
    t.index ["locale"], name: "index_challenge_translations_on_locale", using: :btree
  end

  create_table "challenge_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_types_challenges", force: :cascade do |t|
    t.integer "challenge_type_id"
    t.integer "challenge_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "challenge_type_id"
    t.integer  "curriculum_area_id"
    t.integer  "level"
    t.text     "challenge_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_area_translations", force: :cascade do |t|
    t.integer  "curriculum_area_id",             null: false
    t.string   "locale",             limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",              limit: 255
    t.index ["curriculum_area_id"], name: "index_curriculum_area_translations_on_curriculum_area_id", using: :btree
    t.index ["locale"], name: "index_curriculum_area_translations_on_locale", using: :btree
  end

  create_table "curriculum_areas", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "item_type_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal  "lat",        precision: 10, scale: 7
    t.decimal  "lng",        precision: 10, scale: 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_type_data", force: :cascade do |t|
    t.integer "place_type_id"
    t.string  "data_type",       limit: 255
    t.float   "score"
    t.float   "cost"
    t.float   "cost_multiplier"
  end

  create_table "place_type_translations", force: :cascade do |t|
    t.integer  "place_type_id",             null: false
    t.string   "locale",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label",         limit: 255
    t.index ["locale"], name: "index_place_type_translations_on_locale", using: :btree
    t.index ["place_type_id"], name: "index_place_type_translations_on_place_type_id", using: :btree
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_types_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "place_type_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "external_id", limit: 255
    t.integer  "player_id"
    t.integer  "location_id"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_quantities", force: :cascade do |t|
    t.integer "player_id"
    t.integer "quantity_id"
    t.float   "value"
    t.float   "max_value"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "state",               limit: 255
    t.integer  "location_id"
    t.integer  "destination_id"
    t.integer  "level"
    t.string   "name",                limit: 255
    t.string   "sex",                 limit: 255
    t.datetime "dob"
    t.string   "occupation",          limit: 255
    t.integer  "attractiveness"
    t.integer  "charisma"
    t.integer  "status"
    t.integer  "intelligence"
    t.integer  "luck"
    t.string   "base_locale",         limit: 255
    t.string   "target_locale",       limit: 255
    t.string   "target_dialect",      limit: 255
    t.boolean  "is_current_player"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "quantities", force: :cascade do |t|
    t.string "name",  limit: 255
    t.float  "value"
  end

  create_table "reward_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string   "term",       limit: 255
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_actions", force: :cascade do |t|
    t.integer  "action_type_id"
    t.integer  "reward_id"
    t.integer  "risk_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type",        limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
