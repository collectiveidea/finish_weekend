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

ActiveRecord::Schema.define(:version => 20120309160212) do

  create_table "events", :force => true do |t|
    t.string   "slug"
    t.string   "partner"
    t.string   "host"
    t.string   "venue"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.decimal  "price",              :precision => 6, :scale => 2
    t.integer  "capacity"
    t.string   "name"
    t.text     "description"
    t.text     "schedule"
    t.text     "registration_email"
    t.text     "reminder_email"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "events", ["created_at"], :name => "index_events_on_created_at"
  add_index "events", ["ends_at"], :name => "index_events_on_ends_at"
  add_index "events", ["slug"], :name => "index_events_on_slug", :unique => true
  add_index "events", ["starts_at"], :name => "index_events_on_starts_at"

  create_table "registrations", :force => true do |t|
    t.integer  "event_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "twitter_handle"
    t.string   "twitter_token"
    t.text     "description"
    t.string   "location"
    t.text     "project"
    t.string   "shirt_size"
    t.text     "dietary_needs"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "registrations", ["created_at"], :name => "index_registrations_on_created_at"
  add_index "registrations", ["email"], :name => "index_registrations_on_email", :unique => true
  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"

end
