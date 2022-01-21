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

ActiveRecord::Schema.define(version: 2022_01_27_011706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.uuid "book_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_books_users_on_book_id"
    t.index ["user_id"], name: "index_books_users_on_user_id"
  end

  create_table "budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "daily", default: 0
    t.integer "monthly", default: 0
    t.uuid "book_id"
    t.uuid "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_budgets_on_book_id"
    t.index ["category_id"], name: "index_budgets_on_category_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount"
    t.date "date"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "category_id"
    t.uuid "book_id"
    t.index ["book_id"], name: "index_expenses_on_book_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
  end

  create_table "invites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "inviter"
    t.string "invitee"
    t.string "key"
    t.string "token"
    t.uuid "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_invites_on_book_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "budgets", "books"
  add_foreign_key "budgets", "categories"
  add_foreign_key "expenses", "books"
  add_foreign_key "expenses", "categories"
  add_foreign_key "invites", "books"
end
