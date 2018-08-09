# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_807_104_233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'attachments', force: :cascade do |t|
    t.string 'attachment'
    t.integer 'attachable_id'
    t.string 'attachable_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'detail_incident_reports', force: :cascade do |t|
    t.text 'incident_type', default: [], array: true
    t.string 'people_involved'
    t.string 'other_observer'
    t.string 'date_time_observed'
    t.string 'location'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'incident_reports', force: :cascade do |t|
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'observers', force: :cascade do |t|
    t.string 'name'
    t.string 'email_or_phone'
    t.string 'role'
    t.integer 'detail_incident_report_id'
  end
end
