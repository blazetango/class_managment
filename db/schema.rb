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

ActiveRecord::Schema.define(version: 20190413071352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendences", force: :cascade do |t|
    t.date "session_date"
    t.integer "batch_id"
    t.integer "student_id"
    t.string "remarks"
    t.boolean "attend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.string "day"
    t.time "timing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instrument_id"
    t.integer "duration"
    t.integer "center_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.string "name"
    t.bigint "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "center_id"
    t.index ["month_id"], name: "index_expenses_on_month_id"
  end

  create_table "fees", force: :cascade do |t|
    t.float "amount"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "center_id"
    t.bigint "month_id"
    t.string "fees_frequency"
    t.date "transaction_date"
    t.index ["center_id"], name: "index_fees_on_center_id"
    t.index ["month_id"], name: "index_fees_on_month_id"
    t.index ["student_id"], name: "index_fees_on_student_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "batch_id"
    t.date "date_of_birth"
    t.string "middle_name"
    t.string "last_name"
    t.string "parent_name"
    t.date "date_of_joining"
    t.index ["batch_id"], name: "index_students_on_batch_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.string "transactable_type"
    t.bigint "transactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month_id"
    t.index ["transactable_type", "transactable_id"], name: "index_transactions_on_transactable_type_and_transactable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expenses", "months"
  add_foreign_key "fees", "centers"
  add_foreign_key "fees", "months"
  add_foreign_key "fees", "students"
  add_foreign_key "students", "batches"
end
