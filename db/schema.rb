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

ActiveRecord::Schema.define(version: 20151103085104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_types", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "body_types", ["description"], name: "index_body_types_on_description", unique: true, using: :btree

  create_table "default_preferences", force: :cascade do |t|
    t.integer  "gender_id",  null: false
    t.integer  "desire_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "default_preferences", ["gender_id"], name: "index_default_preferences_on_gender_id", unique: true, using: :btree

  create_table "desired_genders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gender_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "interested", default: false, null: false
  end

  add_index "desired_genders", ["gender_id"], name: "index_desired_genders_on_gender_id", using: :btree
  add_index "desired_genders", ["user_id", "gender_id"], name: "index_desired_genders_on_user_id_and_gender_id", unique: true, using: :btree
  add_index "desired_genders", ["user_id"], name: "index_desired_genders_on_user_id", using: :btree

  create_table "details_of_users", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.datetime "last_online"
    t.integer  "ethnicity_id"
    t.decimal  "height"
    t.integer  "body_type_id"
    t.integer  "relationship_status_id"
    t.integer  "religion_id"
    t.integer  "zip_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "details_of_users", ["body_type_id"], name: "index_details_of_users_on_body_type_id", using: :btree
  add_index "details_of_users", ["ethnicity_id"], name: "index_details_of_users_on_ethnicity_id", using: :btree
  add_index "details_of_users", ["height"], name: "index_details_of_users_on_height", using: :btree
  add_index "details_of_users", ["relationship_status_id"], name: "index_details_of_users_on_relationship_status_id", using: :btree
  add_index "details_of_users", ["religion_id"], name: "index_details_of_users_on_religion_id", using: :btree
  add_index "details_of_users", ["user_id"], name: "index_details_of_users_on_user_id", using: :btree

  create_table "ethnicities", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ethnicities", ["description"], name: "index_ethnicities_on_description", unique: true, using: :btree

  create_table "genders", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "plural",     null: false
  end

  add_index "genders", ["name"], name: "index_genders_on_name", unique: true, using: :btree
  add_index "genders", ["plural"], name: "index_genders_on_plural", unique: true, using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "interests", ["description"], name: "index_interests_on_description", unique: true, using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "matches", ["receiver_id"], name: "index_matches_on_receiver_id", using: :btree
  add_index "matches", ["sender_id", "receiver_id"], name: "index_matches_on_sender_id_and_receiver_id", unique: true, using: :btree
  add_index "matches", ["sender_id"], name: "index_matches_on_sender_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id", "receiver_id"], name: "index_messages_on_sender_id_and_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url",         null: false
    t.string   "thumb_url",   null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", unique: true, using: :btree

  create_table "relationship_statuses", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationship_statuses", ["description"], name: "index_relationship_statuses_on_description", unique: true, using: :btree

  create_table "religions", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "religions", ["title"], name: "index_religions_on_title", unique: true, using: :btree

  create_table "response_categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "response_categories", ["title"], name: "index_response_categories_on_title", unique: true, using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "response_category_id", null: false
    t.integer  "user_id",              null: false
    t.text     "body"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "responses", ["response_category_id"], name: "index_responses_on_response_category_id", using: :btree
  add_index "responses", ["user_id", "response_category_id"], name: "index_responses_on_user_id_and_response_category_id", unique: true, using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "user_interest_links", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_interest_links", ["interest_id"], name: "index_user_interest_links_on_interest_id", using: :btree
  add_index "user_interest_links", ["user_id", "interest_id"], name: "index_user_interest_links_on_user_id_and_interest_id", unique: true, using: :btree
  add_index "user_interest_links", ["user_id"], name: "index_user_interest_links_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "birthdate"
    t.integer  "gender_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "max_radius"
    t.datetime "last_login"
    t.datetime "last_logout"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.integer  "visitor_id", null: false
    t.integer  "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "visits", ["profile_id"], name: "index_visits_on_profile_id", using: :btree
  add_index "visits", ["visitor_id", "profile_id"], name: "index_visits_on_visitor_id_and_profile_id", unique: true, using: :btree
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id", using: :btree

  add_foreign_key "default_preferences", "genders", column: "desire_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "default_preferences", "genders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "desired_genders", "genders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "desired_genders", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "details_of_users", "body_types", on_update: :cascade, on_delete: :cascade
  add_foreign_key "details_of_users", "ethnicities", on_update: :cascade, on_delete: :cascade
  add_foreign_key "details_of_users", "relationship_statuses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "details_of_users", "religions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "details_of_users", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "matches", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "matches", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "messages", "users", column: "receiver_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "messages", "users", column: "sender_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "photos", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "responses", "response_categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "responses", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_interest_links", "interests", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_interest_links", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "genders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "visits", "users", column: "profile_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "visits", "users", column: "visitor_id", on_update: :cascade, on_delete: :cascade
end
