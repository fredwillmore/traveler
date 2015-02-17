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

ActiveRecord::Schema.define(version: 20141206193100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_translations", force: true do |t|
    t.integer  "challenge_id",   null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "challenge_text"
  end

  add_index "challenge_translations", ["challenge_id"], name: "index_challenge_translations_on_challenge_id", using: :btree
  add_index "challenge_translations", ["locale"], name: "index_challenge_translations_on_locale", using: :btree

  create_table "challenge_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.integer  "challenge_type_id"
    t.integer  "curriculum_area_id"
    t.integer  "level"
    t.text     "challenge_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_area_translations", force: true do |t|
    t.integer  "curriculum_area_id", null: false
    t.string   "locale",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "curriculum_area_translations", ["curriculum_area_id"], name: "index_curriculum_area_translations_on_curriculum_area_id", using: :btree
  add_index "curriculum_area_translations", ["locale"], name: "index_curriculum_area_translations_on_locale", using: :btree

  create_table "curriculum_areas", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "item_type_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.decimal  "lat",        precision: 10, scale: 7
    t.decimal  "lng",        precision: 10, scale: 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_type_data", force: true do |t|
    t.integer "place_type_id"
    t.string  "data_type"
    t.float   "score"
    t.float   "cost"
    t.float   "cost_multiplier"
  end

  create_table "place_type_translations", force: true do |t|
    t.integer  "place_type_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label"
  end

  add_index "place_type_translations", ["locale"], name: "index_place_type_translations_on_locale", using: :btree
  add_index "place_type_translations", ["place_type_id"], name: "index_place_type_translations_on_place_type_id", using: :btree

  create_table "place_types", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_types_places", id: false, force: true do |t|
    t.integer "place_id"
    t.integer "place_type_id"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "external_id"
    t.integer  "player_id"
    t.integer  "location_id"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_quantities", force: true do |t|
    t.integer "player_id"
    t.integer "quantity_id"
    t.float   "value"
    t.float   "max_value"
  end

  create_table "players", force: true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "location_id"
    t.integer  "level"
    t.string   "name"
    t.string   "sex"
    t.datetime "dob"
    t.string   "occupation"
    t.integer  "attractiveness"
    t.integer  "charisma"
    t.integer  "status"
    t.integer  "intelligence"
    t.integer  "luck"
    t.string   "base_locale"
    t.string   "target_locale"
    t.string   "target_dialect"
    t.boolean  "is_current_player"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "quantities", force: true do |t|
    t.string "name"
    t.float  "value"
  end

  create_table "reward_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_actions", force: true do |t|
    t.integer  "action_type_id"
    t.integer  "reward_id"
    t.integer  "risk_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
