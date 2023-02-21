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

ActiveRecord::Schema.define(version: 2022_11_27_190706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "milkmen", force: :cascade do |t|
    t.string "dairy_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_milkmen_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "white_label_app_payment_details", force: :cascade do |t|
    t.bigint "white_label_app_id"
    t.string "paid_amount"
    t.string "remaining_amount"
    t.string "paid_in_account"
    t.datetime "plan_end_date"
    t.datetime "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["white_label_app_id"], name: "index_white_label_app_payment_details_on_white_label_app_id"
  end

  create_table "white_label_apps", force: :cascade do |t|
    t.bigint "milkman_id"
    t.string "android_store_email"
    t.string "android_store_password"
    t.string "apple_store_email"
    t.string "apple_store_password"
    t.string "github_customer_app_branch_name"
    t.string "github_business_app_branch_name"
    t.integer "app_launched", default: 0
    t.integer "app_type", default: 0
    t.string "total_section_a_amount"
    t.string "total_section_b_amount"
    t.string "discount"
    t.boolean "app_plan_included"
    t.integer "number_of_customer_app_plan", default: 0
    t.string "remaining_amount"
    t.string "final_amount"
    t.string "set_amount_increment"
    t.string "agreement_google_drive_url"
    t.integer "deal_status", default: 0
    t.string "deal_closed_by"
    t.string "deal_payment_google_drive_url"
    t.datetime "cust_android_app_launched_date"
    t.datetime "cust_ios_app_launched_date"
    t.datetime "business_android_app_launched_date"
    t.integer "payment_paid_details", default: 0
    t.datetime "plan_start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milkman_id"], name: "index_white_label_apps_on_milkman_id"
  end

  add_foreign_key "milkmen", "users"
  add_foreign_key "white_label_app_payment_details", "white_label_apps"
  add_foreign_key "white_label_apps", "milkmen"
end
