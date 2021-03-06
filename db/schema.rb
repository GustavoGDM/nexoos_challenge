# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_01_160740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "loan_applicant_id", null: false
    t.index ["loan_applicant_id"], name: "index_addresses_on_loan_applicant_id"
  end

  create_table "loan_applicants", force: :cascade do |t|
    t.string "company_name"
    t.string "cnpj"
    t.string "phones", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "loan_id", null: false
    t.index ["loan_id"], name: "index_loan_applicants_on_loan_id"
  end

  create_table "loan_installments", force: :cascade do |t|
    t.float "value"
    t.integer "installment_number"
    t.datetime "due_date"
    t.bigint "loan_id", null: false
    t.bigint "loan_applicant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applicant_id"], name: "index_loan_installments_on_loan_applicant_id"
    t.index ["loan_id"], name: "index_loan_installments_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.float "amount"
    t.integer "installments"
    t.float "monthly_rate"
    t.datetime "date_acquisition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "loan_applicants"
  add_foreign_key "loan_applicants", "loans"
  add_foreign_key "loan_installments", "loan_applicants"
  add_foreign_key "loan_installments", "loans"
end
