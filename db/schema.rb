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

ActiveRecord::Schema[7.0].define(version: 2022_11_07_092006) do
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

  create_table "accounts_conversations", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accounts_conversations_on_account_id"
    t.index ["conversation_id"], name: "index_accounts_conversations_on_conversation_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "logo"
    t.string "website"
    t.text "about"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["account_id"], name: "index_businesses_on_account_id"
    t.index ["slug"], name: "index_businesses_on_slug", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "participant_ids", null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["participant_ids"], name: "index_conversations_on_participant_ids", unique: true
    t.index ["slug"], name: "index_conversations_on_slug", unique: true
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
    t.integer "search_status", default: 0
    t.boolean "allow_notifications", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "programming_languages", default: [], array: true
    t.string "role_levels", default: [], array: true
    t.index ["account_id"], name: "index_developers_on_account_id"
    t.index ["slug"], name: "index_developers_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.bigint "account_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["account_id"], name: "index_messages_on_account_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_projects_on_developer_id"
  end

  create_table "projects_tools", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_tools_on_project_id"
    t.index ["tool_id"], name: "index_projects_tools_on_tool_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "programming_languages"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role_level"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts_conversations", "accounts"
  add_foreign_key "accounts_conversations", "conversations"
  add_foreign_key "businesses", "accounts"
  add_foreign_key "developers", "accounts"
  add_foreign_key "messages", "accounts"
  add_foreign_key "messages", "conversations"
  add_foreign_key "projects", "developers"
  add_foreign_key "projects_tools", "projects"
  add_foreign_key "projects_tools", "tools"
end
