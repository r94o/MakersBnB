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

ActiveRecord::Schema[7.0].define(version: 2022_03_23_164533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date"
    t.bigint "space_id"
    t.bigint "user_id"
    t.bigint "status_id"
    t.index ["space_id"], name: "index_bookings_on_space_id"
    t.index ["status_id"], name: "index_bookings_on_status_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.string "picture"
    t.datetime "available_from"
    t.datetime "available_to"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "bookings", "spaces"
  add_foreign_key "bookings", "statuses"
  add_foreign_key "bookings", "users"
  add_foreign_key "spaces", "users"
end
