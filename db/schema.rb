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

ActiveRecord::Schema.define(version: 20170716022253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_restaurant_zones", force: :cascade do |t|
    t.bigint "delivery_date_id"
    t.bigint "restaurant_id"
    t.bigint "delivery_zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_date_id"], name: "index_date_restaurant_zones_on_delivery_date_id"
    t.index ["delivery_zone_id"], name: "index_date_restaurant_zones_on_delivery_zone_id"
    t.index ["restaurant_id"], name: "index_date_restaurant_zones_on_restaurant_id"
  end

  create_table "delivery_dates", force: :cascade do |t|
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
