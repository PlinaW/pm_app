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

ActiveRecord::Schema[7.0].define(version: 2023_10_10_183813) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epics", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name", null: false
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.index ["project_id"], name: "index_epics_on_project_id"
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "epic_id"
    t.string "name", null: false
    t.text "description"
    t.string "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["epic_id"], name: "index_issues_on_epic_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name", null: false
    t.string "goal"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "issue_id"
    t.bigint "sprint_id"
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.integer "priority"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_tasks_on_sprint_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["issue_id"], name: "index_tasks_on_issue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "epics", "projects"
  add_foreign_key "issues", "epics"
  add_foreign_key "tasks", "issues", column: "issue_id"
  add_foreign_key "tasks", "sprints"
  add_foreign_key "tasks", "users"
end
