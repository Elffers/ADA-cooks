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

ActiveRecord::Schema.define(version: 20131205215656) do

  create_table "cookbook_recipes", force: true do |t|
    t.integer  "cookbook_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  create_table "cookbooks", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gadget_recipes", force: true do |t|
    t.integer  "gadget_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gadgets", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "function"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients_recipes", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "process"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vegetarian"
    t.boolean  "gluten"
    t.boolean  "dairy"
    t.boolean  "soy"
    t.boolean  "vegan"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "whatvore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
