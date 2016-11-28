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

ActiveRecord::Schema.define(version: 20161111152603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bonds", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string   "name",                            null: false
    t.integer  "hp_mod",              default: 4
    t.integer  "exp_points",          default: 0
    t.integer  "player_character_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["player_character_id"], name: "index_character_classes_on_player_character_id", using: :btree
  end

  create_table "class_alignments", force: :cascade do |t|
    t.integer  "character_class_id"
    t.integer  "alignment_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["alignment_id"], name: "index_class_alignments_on_alignment_id", using: :btree
    t.index ["character_class_id"], name: "index_class_alignments_on_character_class_id", using: :btree
  end

  create_table "class_bonds", force: :cascade do |t|
    t.integer  "character_class_id"
    t.integer  "bond_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["bond_id"], name: "index_class_bonds_on_bond_id", using: :btree
    t.index ["character_class_id"], name: "index_class_bonds_on_character_class_id", using: :btree
  end

  create_table "class_moves", force: :cascade do |t|
    t.integer  "move_level"
    t.integer  "character_class_id"
    t.integer  "move_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["character_class_id"], name: "index_class_moves_on_character_class_id", using: :btree
    t.index ["move_id"], name: "index_class_moves_on_move_id", using: :btree
  end

  create_table "class_races", force: :cascade do |t|
    t.integer  "character_class_id"
    t.integer  "race_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["character_class_id"], name: "index_class_races_on_character_class_id", using: :btree
    t.index ["race_id"], name: "index_class_races_on_race_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "player_characters", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "description"
    t.integer  "level",          default: 1
    t.integer  "strength",       default: 1
    t.integer  "dexterity",      default: 1
    t.integer  "constitution",   default: 1
    t.integer  "intelligence",   default: 1
    t.integer  "wisdom",         default: 1
    t.integer  "charisma",       default: 1
    t.text     "inventory"
    t.integer  "player_id"
    t.integer  "game_master_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "starting_items", force: :cascade do |t|
    t.integer  "character_class_id"
    t.integer  "item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["character_class_id"], name: "index_starting_items_on_character_class_id", using: :btree
    t.index ["item_id"], name: "index_starting_items_on_item_id", using: :btree
  end

  add_foreign_key "character_classes", "player_characters"
  add_foreign_key "class_alignments", "alignments"
  add_foreign_key "class_alignments", "character_classes"
  add_foreign_key "class_bonds", "bonds"
  add_foreign_key "class_bonds", "character_classes"
  add_foreign_key "class_moves", "character_classes"
  add_foreign_key "class_moves", "moves"
  add_foreign_key "class_races", "character_classes"
  add_foreign_key "class_races", "races"
  add_foreign_key "starting_items", "character_classes"
  add_foreign_key "starting_items", "items"
end
