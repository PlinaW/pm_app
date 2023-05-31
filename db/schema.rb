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

ActiveRecord::Schema[7.0].define(version: 2023_05_30_163102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epics", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.text "description"
    t.string "type"
    t.string "status"
    t.integer "priority"
    t.text "comment"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_epics_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.text "goal"
    t.string "created_by"
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_story_id"
    t.bigint "sprint_id"
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.integer "priority"
    t.text "comment"
    t.string "created_by"
    t.string "owner"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_tasks_on_sprint_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["user_story_id"], name: "index_tasks_on_user_story_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.bigint "epic_id"
    t.string "name"
    t.text "description"
    t.string "status"
    t.integer "priority"
    t.text "comment"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["epic_id"], name: "index_user_stories_on_epic_id"
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
  add_foreign_key "tasks", "sprints"
  add_foreign_key "tasks", "user_stories"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_stories", "epics"
end
