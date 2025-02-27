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

ActiveRecord::Schema[8.0].define(version: 2025_02_27_070356) do
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
    t.json "drops"
    t.string "recipe_id"
    t.index ["character_id"], name: "index_actions_on_character_id"
    t.index ["location_id"], name: "index_actions_on_location_id"
    t.index ["node_id"], name: "index_actions_on_node_id"
    t.index ["recipe_id"], name: "index_actions_on_recipe_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_id"
    t.boolean "online", default: false
    t.string "race_id"
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

  create_table "guild_characters", force: :cascade do |t|
    t.integer "guild_id", null: false
    t.integer "character_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_guild_characters_on_character_id", unique: true
    t.index ["guild_id"], name: "index_guild_characters_on_guild_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "actions", "characters"
  add_foreign_key "equipment_items", "characters"
  add_foreign_key "guild_characters", "characters"
  add_foreign_key "guild_characters", "guilds"
  add_foreign_key "inventory_items", "characters"
end
