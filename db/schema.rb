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

ActiveRecord::Schema[7.1].define(version: 2024_04_24_232217) do
  create_table "attractions", force: :cascade do |t|
    t.string "attraction_place_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.text "address"
    t.string "image_url"
    t.boolean "toilets"
    t.boolean "wheelchair"
    t.boolean "changing_table"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_place_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_place_id"], name: "index_cities_on_city_place_id", unique: true
    t.index ["name"], name: "index_for_city_name", unique: true
  end

  create_table "cities_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "city_id", null: false
    t.index ["city_id", "user_id"], name: "index_cities_users_on_city_id_and_user_id"
    t.index ["user_id", "city_id"], name: "index_cities_users_on_user_id_and_city_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_place_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.string "address"
    t.string "image_url"
    t.boolean "wheelchair"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_hotels_on_city_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "restaurant_place_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.string "address"
    t.string "image_url"
    t.string "cuisine"
    t.boolean "wheelchair"
    t.string "indoor_seating"
    t.string "outdoor_seating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_restaurants_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attractions", "cities"
  add_foreign_key "hotels", "cities"
  add_foreign_key "restaurants", "cities"
end
