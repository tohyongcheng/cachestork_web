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

ActiveRecord::Schema.define(version: 20150328110625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_requests", id: false, force: true do |t|
    t.integer "request_id"
    t.integer "category_id"
  end

  add_index "categories_requests", ["category_id"], name: "index_categories_requests_on_category_id", using: :btree
  add_index "categories_requests", ["request_id"], name: "index_categories_requests_on_request_id", using: :btree

  create_table "categories_videos", id: false, force: true do |t|
    t.integer "video_id"
    t.integer "category_id"
  end

  add_index "categories_videos", ["category_id"], name: "index_categories_videos_on_category_id", using: :btree
  add_index "categories_videos", ["video_id"], name: "index_categories_videos_on_video_id", using: :btree

  create_table "requests", force: true do |t|
    t.string   "name"
    t.string   "high_school"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
  end

  create_table "videos", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "thumbnail_url"
    t.text     "description"
    t.string   "video_id"
  end

  add_index "videos", ["category_id"], name: "index_videos_on_category_id", using: :btree

end
