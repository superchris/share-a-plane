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

ActiveRecord::Schema.define(version: 20181003204129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buying_groups", force: :cascade do |t|
    t.integer "cost"
    t.string "aircraft_type"
    t.integer "engine_time"
    t.integer "tboh"
    t.integer "max_members"
    t.integer "hangar_fee"
    t.integer "annual_insurance_cost"
    t.integer "annual_inspection_cost"
    t.integer "overhaul_cost"
    t.integer "hourly_maintenance_reserve"
    t.float "price_per_gallon"
    t.integer "gallons_per_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.bigint "airport_id"
    t.index ["airport_id"], name: "index_buying_groups_on_airport_id"
    t.index ["created_by_id"], name: "index_buying_groups_on_created_by_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "buying_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buying_group_id"], name: "index_memberships_on_buying_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buying_groups", "users", column: "created_by_id"
  add_foreign_key "memberships", "buying_groups"
  add_foreign_key "memberships", "users"
end
