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

ActiveRecord::Schema.define(version: 20140529141139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "channel_playlists", force: true do |t|
    t.string   "author"
    t.string   "name"
    t.text     "description"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mpd_socket_path"
    t.string   "coverart"
    t.string   "icecast_mountpoint"
  end

  create_table "episodes", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "pub_date"
    t.string   "guid"
    t.text     "subtitle"
    t.text     "content"
    t.integer  "duration"
    t.text     "flattr_url"
    t.string   "icon_url"
    t.string   "audio_file_url"
    t.string   "audio"
    t.integer  "podcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "filesize"
    t.string   "coverart"
  end

  add_index "episodes", ["guid"], name: "index_episodes_on_guid", unique: true, using: :btree
  add_index "episodes", ["podcast_id"], name: "index_episodes_on_podcast_id", using: :btree

  create_table "jingles", force: true do |t|
    t.string   "title"
    t.integer  "duration"
    t.string   "audio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlist_entries", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "premiere",            default: false
    t.integer  "channel_playlist_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "jingle_id"
  end

  add_index "playlist_entries", ["channel_playlist_id"], name: "index_playlist_entries_on_channel_playlist_id", using: :btree
  add_index "playlist_entries", ["episode_id"], name: "index_playlist_entries_on_episode_id", using: :btree
  add_index "playlist_entries", ["jingle_id"], name: "index_playlist_entries_on_jingle_id", using: :btree

  create_table "podcasts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "logo_url"
    t.string   "website"
    t.string   "feed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "subtitle"
    t.string   "language"
    t.string   "coverart"
  end

  add_index "podcasts", ["feed", "title"], name: "index_podcasts_on_feed_and_title", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
