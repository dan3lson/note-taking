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

ActiveRecord::Schema.define(version: 20160411213938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.string   "organizer",  null: false
    t.string   "subject",    null: false
    t.datetime "start_date", null: false
    t.datetime "end_date",   null: false
    t.string   "attendees"
    t.text     "body"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "api_id",     null: false
  end

  create_table "note_records", force: :cascade do |t|
    t.integer  "note_id",      null: false
    t.integer  "note_type_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "note_types", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
