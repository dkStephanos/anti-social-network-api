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

ActiveRecord::Schema.define(version: 20180222235822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "connected_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connected_user_id"], name: "index_connections_on_connected_user_id"
    t.index ["user_id", "connected_user_id"], name: "index_connections_on_user_id_and_connected_user_id", unique: true
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.string "postType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "user_id"
    t.string "title"
    t.string "picture"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_url"
    t.text "bio"
  end

  add_foreign_key "connections", "users"
  add_foreign_key "connections", "users", column: "connected_user_id"
end
