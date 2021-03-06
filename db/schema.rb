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

ActiveRecord::Schema.define(version: 20140728043333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefit_plan_options", force: true do |t|
    t.integer  "benefit_plan_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefit_plans", force: true do |t|
    t.integer  "benefit_provider_id"
    t.integer  "benefit_type_id"
    t.string   "name"
    t.integer  "display_priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefit_providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefit_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "full_name"
    t.string   "default_tz"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "company_benefit_plan_options", force: true do |t|
    t.integer  "company_id"
    t.integer  "benefit_plan_option_id"
    t.decimal  "total_cost_per_period"
    t.decimal  "employee_cost_per_period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "company_user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_company_benefit_plan_options", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_benefit_plan_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "tz"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
