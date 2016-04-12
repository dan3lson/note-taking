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

ActiveRecord::Schema.define(version: 20160412053112) do

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
    t.string   "api_id",     null: false
  end

  add_index "meetings", ["api_id"], name: "index_meetings_on_api_id", using: :btree
  add_index "meetings", ["end_date"], name: "index_meetings_on_end_date", using: :btree
  add_index "meetings", ["start_date"], name: "index_meetings_on_start_date", using: :btree

  create_table "note_records", force: :cascade do |t|
    t.integer  "note_id",      null: false
    t.integer  "note_type_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "note_records", ["note_id", "note_type_id"], name: "index_note_records_on_note_id_and_note_type_id", using: :btree
  add_index "note_records", ["note_id"], name: "index_note_records_on_note_id", using: :btree
  add_index "note_records", ["note_type_id"], name: "index_note_records_on_note_type_id", using: :btree

  create_table "note_types", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "note_types", ["name"], name: "index_note_types_on_name", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["meeting_id"], name: "index_notes_on_meeting_id", using: :btree

end
