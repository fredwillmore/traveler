# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_18_190154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authentication_tokens", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "user_id"
    t.datetime "expires_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "challenge_translations", id: :serial, force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.string "locale", limit: 255, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "challenge_text"
    t.index ["challenge_id"], name: "index_challenge_translations_on_challenge_id"
    t.index ["locale"], name: "index_challenge_translations_on_locale"
  end

  create_table "challenge_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
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
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "curriculum_area_translations", id: :serial, force: :cascade do |t|
    t.integer "curriculum_area_id", null: false
    t.string "locale", limit: 255, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "title", limit: 255
    t.index ["curriculum_area_id"], name: "index_curriculum_area_translations_on_curriculum_area_id"
    t.index ["locale"], name: "index_curriculum_area_translations_on_locale"
  end

  create_table "curriculum_areas", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "item_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.integer "item_type_id"
    t.integer "value"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 7
    t.decimal "lng", precision: 10, scale: 7
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "place_type_data", id: :serial, force: :cascade do |t|
    t.integer "place_type_id"
    t.string "data_type", limit: 255
    t.float "score"
    t.float "cost"
    t.float "cost_multiplier"
  end

  create_table "place_type_translations", id: :serial, force: :cascade do |t|
    t.integer "place_type_id", null: false
    t.string "locale", limit: 255, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "label", limit: 255
    t.index ["locale"], name: "index_place_type_translations_on_locale"
    t.index ["place_type_id"], name: "index_place_type_translations_on_place_type_id"
  end

  create_table "place_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "label", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "place_types_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "place_type_id"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "external_id", limit: 255
    t.integer "location_id"
    t.float "rating"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "player_quantities", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "quantity_id"
    t.float "value"
    t.float "max_value"
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "state", limit: 255
    t.integer "location_id"
    t.integer "destination_id"
    t.integer "level"
    t.string "name", limit: 255
    t.string "sex", limit: 255
    t.datetime "dob", precision: nil
    t.string "occupation", limit: 255
    t.integer "attractiveness"
    t.integer "charisma"
    t.integer "status"
    t.integer "intelligence"
    t.integer "luck"
    t.string "base_locale", limit: 255
    t.string "target_locale", limit: 255
    t.string "target_dialect", limit: 255
    t.boolean "is_current_player"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "avatar_file_name", limit: 255
    t.string "avatar_content_type", limit: 255
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at", precision: nil
  end

  create_table "quantities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.float "value"
  end

  create_table "reward_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "rewards", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "search_suggestions", id: :serial, force: :cascade do |t|
    t.string "term", limit: 255
    t.integer "popularity"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "user_actions", id: :serial, force: :cascade do |t|
    t.integer "action_type_id"
    t.integer "reward_id"
    t.integer "risk_id"
    t.integer "challenge_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "invitation_token", limit: 255
    t.datetime "invitation_created_at", precision: nil
    t.datetime "invitation_sent_at", precision: nil
    t.datetime "invitation_accepted_at", precision: nil
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type", limit: 255
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authentication_tokens", "users"
end
