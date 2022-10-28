# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_28_002546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "logo"
    t.string "website"
    t.text "about"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_businesses_on_account_id"
  end

  create_table "developers", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.text "about"
    t.string "title"
    t.string "profile_picture"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.string "website"
    t.string "github"
    t.string "role_types", array: true
    t.string "search_types", array: true
    t.boolean "allow_notifications", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_developers_on_account_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "programming_language_id", null: false
    t.integer "duration_in_years"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_experiences_on_account_id"
    t.index ["programming_language_id"], name: "index_experiences_on_programming_language_id"
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "businesses", "accounts"
  add_foreign_key "developers", "accounts"
  add_foreign_key "experiences", "accounts"
  add_foreign_key "experiences", "programming_languages"
end
