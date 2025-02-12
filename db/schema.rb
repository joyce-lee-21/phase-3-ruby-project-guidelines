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

ActiveRecord::Schema.define(version: 2021_07_14_233053) do

  create_table "add_events", force: :cascade do |t|
    t.integer "event_id"
    t.integer "job_seeker_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "recruiter_id"
    t.datetime "event_date"
    t.text "location"
    t.text "description"
    t.string "name"
    t.text "image"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "name"
    t.text "location"
    t.string "username"
    t.string "password"
    t.string "email"
    t.text "image"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.text "user_type"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "name"
    t.text "company_name"
    t.text "location"
    t.string "username"
    t.string "password"
    t.string "email"
    t.text "logo"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "profile_id"
    t.string "name"
    t.integer "level"
    t.text "logo"
  end

end
