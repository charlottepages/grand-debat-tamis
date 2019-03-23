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

ActiveRecord::Schema.define(version: 2019_03_23_124147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "answers_id"
    t.bigint "tags_id"
    t.index ["answers_id"], name: "index_answer_tags_on_answers_id"
    t.index ["tags_id"], name: "index_answer_tags_on_tags_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "zipcode"
    t.string "theme"
    t.string "source"
    t.string "contributor_type"
    t.datetime "published_at"
    t.integer "flag_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "questions_id"
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.string "theme"
    t.string "grand_debat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saves", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "answers_id"
    t.index ["answers_id"], name: "index_saves_on_answers_id"
    t.index ["users_id"], name: "index_saves_on_users_id"
  end

  create_table "tags", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.string "circonscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end