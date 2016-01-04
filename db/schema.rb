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

ActiveRecord::Schema.define(version: 20151126202119) do

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.integer  "crm_number"
    t.text     "address"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors_specializations", force: true do |t|
    t.integer "doctor_id"
    t.integer "specialization_id"
  end

  create_table "medical_consultations", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "specialization_id"
    t.datetime "date"
    t.text     "syntoms"
    t.text     "reason"
    t.text     "medical_opinion"
    t.text     "prescription"
    t.text     "ordered_tests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specializations", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "role"
  end

end
