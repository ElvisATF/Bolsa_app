# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_24_231713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.text "content"
    t.bigint "user_entity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_entity_id", "created_at"], name: "index_offers_on_user_entity_id_and_created_at"
    t.index ["user_entity_id"], name: "index_offers_on_user_entity_id"
  end

  create_table "user_entities", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "confirmation_password"
    t.string "address"
    t.string "postal_cod"
    t.integer "contact"
    t.integer "nif"
    t.string "locality"
    t.string "professional_activity"
    t.string "presentation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_user_entities_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.string "name"
    t.string "address"
    t.integer "postal_cod"
    t.string "locality"
    t.integer "contact"
    t.string "identity_card"
    t.string "professional_area"
    t.string "presentation"
    t.string "level_of_qualifications"
    t.string "literary_abilities"
    t.string "professional_situation"
    t.string "professional_expirience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "offers", "user_entities"
end
