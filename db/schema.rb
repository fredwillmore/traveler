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

ActiveRecord::Schema.define(:version => 20130422144807) do

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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "location_id"
    t.integer  "level"
    t.string   "sex"
    t.datetime "dob"
    t.string   "occupation"
    t.integer  "energy"
    t.integer  "food"
    t.integer  "water"
    t.integer  "bio"
    t.integer  "money"
    t.integer  "confidence"
    t.integer  "attractiveness"
    t.integer  "charisma"
    t.integer  "status"
    t.integer  "intelligence"
    t.integer  "luck"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.string   "name"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
