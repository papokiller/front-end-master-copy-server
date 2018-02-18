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

ActiveRecord::Schema.define(version: 20180218024018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.string "name_instructor"
    t.string "bio_instructor"
    t.string "time_course"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "name"
    t.index ["course_id"], name: "index_episodes_on_course_id"
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "episode_id"
    t.string "name"
    t.string "description"
    t.string "time"
    t.string "link"
    t.string "image"
    t.boolean "download_local"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "video_url_local"
    t.integer "status", default: 0
    t.index ["episode_id"], name: "index_parts_on_episode_id"
  end

  create_table "uploader_files", force: :cascade do |t|
    t.bigint "part_id"
    t.json "data"
    t.bigint "uploader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_uploader_files_on_part_id"
    t.index ["uploader_id"], name: "index_uploader_files_on_uploader_id"
  end

  create_table "uploaders", force: :cascade do |t|
    t.json "data"
    t.string "service"
    t.string "username"
    t.string "password"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "courses"
  add_foreign_key "parts", "episodes"
  add_foreign_key "uploader_files", "parts"
  add_foreign_key "uploader_files", "uploaders"
end
