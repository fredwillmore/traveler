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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130505133548) do

  create_table "action_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "actions", :force => true do |t|
    t.integer  "action_type_id"
    t.integer  "reward_id"
    t.integer  "risk_id"
    t.integer  "challenge_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "challenge_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "challenges", :force => true do |t|
    t.integer  "challenge_type_id"
    t.integer  "level"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "curriculum_area_translations", :force => true do |t|
    t.integer  "curriculum_area_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "curriculum_area_translations", ["curriculum_area_id"], :name => "index_curriculum_area_translations_on_curriculum_area_id"
  add_index "curriculum_area_translations", ["locale"], :name => "index_curriculum_area_translations_on_locale"

  create_table "curriculum_areas", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "item_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "item_type_id"
    t.integer  "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.decimal  "lat",        :precision => 10, :scale => 7
    t.decimal  "lng",        :precision => 10, :scale => 7
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "place_type_data", :force => true do |t|
    t.integer "place_type_id"
    t.string  "data_type"
    t.float   "score"
    t.float   "cost"
    t.float   "cost_multiplier"
  end

  create_table "place_type_translations", :force => true do |t|
    t.integer  "place_type_id"
    t.string   "locale"
    t.string   "label"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "place_type_translations", ["locale"], :name => "index_place_type_translations_on_locale"
  add_index "place_type_translations", ["place_type_id"], :name => "index_place_type_translations_on_place_type_id"

  create_table "place_types", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "place_types_places", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "place_type_id"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "external_id"
    t.integer  "player_id"
    t.integer  "location_id"
    t.float    "rating"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "player_quantities", :force => true do |t|
    t.integer "player_id"
    t.integer "quantity_id"
    t.float   "value"
    t.float   "max_value"
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "level"
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "quantities", :force => true do |t|
    t.string "name"
    t.float  "value"
  end

  create_table "reward_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rewards", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
