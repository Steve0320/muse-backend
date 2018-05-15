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

ActiveRecord::Schema.define(version: 20180510215424) do

  create_table "episodes", force: :cascade do |t|
    t.integer "episode_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season_id"
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "backdrop_path"
    t.string "homepage"
    t.string "tmdb_id", null: false
    t.string "imdb_id", null: false
    t.string "original_language"
    t.string "original_title"
    t.string "description"
    t.float "popularity"
    t.string "poster_path"
    t.date "release_date"
    t.integer "runtime"
    t.string "status"
    t.string "tagline"
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imdb_id"], name: "index_movies_on_imdb_id", unique: true
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id", unique: true
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "season_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "show_id"
    t.index ["show_id"], name: "index_seasons_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "tvdb_id"
    t.string "tvdb_link"
    t.string "cover_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tvdb_id"], name: "index_shows_on_tvdb_id", unique: true
  end

end
