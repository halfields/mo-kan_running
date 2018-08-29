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

ActiveRecord::Schema.define(version: 20180820230446) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.text "contact_email"
    t.text "message"
    t.integer "organizer_id"
    t.string "location"
    t.string "start_time"
    t.string "races_string"
    t.string "website_url"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
