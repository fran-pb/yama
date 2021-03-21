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

ActiveRecord::Schema.define(version: 2021_03_20_195619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_roles", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "person_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id", "person_id", "role"], name: "index_movie_roles_on_movie_id_and_person_id_and_role", unique: true
    t.index ["movie_id"], name: "index_movie_roles_on_movie_id"
    t.index ["person_id"], name: "index_movie_roles_on_person_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "year", null: false
    t.string "slug", null: false
    t.string "imdbid"
    t.string "genre"
    t.text "plot"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.string "api_response_code"
    t.string "api_response_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_payments_on_movie_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "movie_roles", "movies"
  add_foreign_key "movie_roles", "people"
  add_foreign_key "payments", "movies"
end
