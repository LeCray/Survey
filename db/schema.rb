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

ActiveRecord::Schema.define(version: 20180202120831) do

  create_table "building_exterior_questions", force: :cascade do |t|
    t.integer "building_exterior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_exteriors", force: :cascade do |t|
    t.integer "exterior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exteriors", force: :cascade do |t|
    t.integer "on_campus_residence_hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_campus_residence_halls", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.decimal "telephone"
    t.decimal "mobile"
    t.string "home_province"
    t.string "organisation"
    t.string "position"
    t.string "title"
    t.string "current_campus"
    t.string "future_campus"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
