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

ActiveRecord::Schema.define(version: 20160321205402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string  "comment_text"
    t.integer "factorio_map_id"
  end

  add_index "comments", ["factorio_map_id"], name: "index_comments_on_factorio_map_id", using: :btree

  create_table "factorio_maps", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "comments", "factorio_maps"
end
