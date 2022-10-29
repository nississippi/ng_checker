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

ActiveRecord::Schema.define(version: 2022_10_29_214600) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.integer "story_genre_id"
    t.integer "media_genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_genre_id"], name: "index_contents_on_media_genre_id"
    t.index ["story_genre_id"], name: "index_contents_on_story_genre_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.boolean "is_deleted"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "media_genres", force: :cascade do |t|
    t.string "media"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ng_answers", force: :cascade do |t|
    t.integer "ng_expression_id"
    t.integer "customer_id"
    t.integer "vote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_ng_answers_on_customer_id"
    t.index ["ng_expression_id"], name: "index_ng_answers_on_ng_expression_id"
  end

  create_table "ng_expressions", force: :cascade do |t|
    t.integer "ng_genre_id", null: false
    t.string "ng_expression"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vote"
    t.index ["ng_genre_id"], name: "index_ng_expressions_on_ng_genre_id"
  end

  create_table "ng_genres", force: :cascade do |t|
    t.string "ng_genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ng_tagging_contents", force: :cascade do |t|
    t.integer "ng_expression_id"
    t.integer "content_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_ng_tagging_contents_on_content_id"
    t.index ["ng_expression_id"], name: "index_ng_tagging_contents_on_ng_expression_id"
  end

  create_table "story_genres", force: :cascade do |t|
    t.string "story"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "vote"
    t.integer "customer_id"
    t.integer "ng_expression_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_votes_on_customer_id"
    t.index ["ng_expression_id"], name: "index_votes_on_ng_expression_id"
  end

  add_foreign_key "ng_expressions", "ng_genres"
end
