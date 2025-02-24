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

ActiveRecord::Schema[8.0].define(version: 2025_02_24_223926) do
  create_table "actions", force: :cascade do |t|
    t.integer "character_id", null: false
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.string "seed"
    t.datetime "next_tick_at"
    t.datetime "last_tick_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_id"
    t.string "node_id"
    t.index ["character_id"], name: "index_actions_on_character_id"
    t.index ["location_id"], name: "index_actions_on_location_id"
    t.index ["node_id"], name: "index_actions_on_node_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_id"
    t.index ["location_id"], name: "index_characters_on_location_id"
    t.index ["name"], name: "index_characters_on_name", unique: true
  end

  create_table "equipment_items", force: :cascade do |t|
    t.integer "character_id", null: false
    t.string "item_id"
    t.string "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "slot"], name: "index_equipment_items_on_character_id_and_slot", unique: true
    t.index ["character_id"], name: "index_equipment_items_on_character_id"
    t.index ["item_id", "character_id", "slot"], name: "index_equipment_items_on_item_id_and_character_id_and_slot", unique: true
    t.index ["item_id"], name: "index_equipment_items_on_item_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "character_id", null: false
    t.string "item_id"
    t.integer "quantity"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_inventory_items_on_character_id"
    t.index ["item_id", "character_id"], name: "index_inventory_items_on_item_id_and_character_id", unique: true
    t.index ["item_id"], name: "index_inventory_items_on_item_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "actions", "characters"
  add_foreign_key "equipment_items", "characters"
  add_foreign_key "inventory_items", "characters"
end
