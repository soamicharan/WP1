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

ActiveRecord::Schema.define(version: 2019_07_22_092000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.date "date_of_registration"
    t.date "date_of_closure"
    t.text "address"
    t.integer "age"
    t.string "branch"
    t.string "contact_number"
    t.string "email"
    t.string "experience"
    t.string "gender"
    t.string "name"
    t.string "qualification"
    t.string "registration_number"
    t.integer "remarks"
    t.string "specialization"
    t.string "source_of_registration"
    t.string "state"
    t.string "status"
    t.string "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "status_changed"
    t.string "mobility"
    t.index ["contact_number"], name: "index_candidates_on_contact_number", unique: true
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["registration_number"], name: "index_candidates_on_registration_number", unique: true
  end

  create_table "counsellings", force: :cascade do |t|
    t.text "note"
    t.date "counselling_date"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_counsellings_on_candidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
