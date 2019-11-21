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

ActiveRecord::Schema.define(version: 2019_11_21_131236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "type_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
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
    t.string "type_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
