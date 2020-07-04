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

ActiveRecord::Schema.define(version: 2020_07_04_132018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "titre"
    t.text "content"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "photos"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "author_blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nick_name"
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_post_categories", force: :cascade do |t|
    t.bigint "blog_post_id"
    t.bigint "blog_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_category_id"], name: "index_blog_post_categories_on_blog_category_id"
    t.index ["blog_post_id"], name: "index_blog_post_categories_on_blog_post_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.bigint "author_blog_id"
    t.string "title", default: ""
    t.string "description", default: ""
    t.boolean "published", default: true
    t.string "titre", default: ""
    t.text "content", default: ""
    t.datetime "custom_date"
    t.string "photos"
    t.string "slug"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "canonical"
    t.string "link_left"
    t.string "link_right"
    t.index ["author_blog_id"], name: "index_blog_posts_on_author_blog_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holiday_rentings", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "city"
    t.string "zip_code"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "published"
    t.string "title"
    t.string "slug"
    t.string "category"
    t.string "airbnb"
    t.string "booking"
    t.string "tel"
    t.string "email"
  end

  create_table "marche_noels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_post_categories_on_article_id"
    t.index ["category_id"], name: "index_post_categories_on_category_id"
  end

  create_table "rentings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thomas"
    t.string "titre"
    t.text "description"
    t.string "summary"
    t.string "website"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.float "longitude"
    t.float "latitude"
    t.boolean "published"
    t.string "title"
    t.string "slug"
    t.string "category"
    t.string "airbnb"
    t.string "booking"
    t.string "tel"
    t.string "email"
    t.bigint "user_id"
    t.integer "capacity"
    t.boolean "animals", default: false
    t.boolean "family", default: false
    t.boolean "cure", default: false
    t.float "niederbronn_dist"
    t.float "morsbronn_dist"
    t.index ["user_id"], name: "index_rentings_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "categories"
  add_foreign_key "blog_post_categories", "blog_categories"
  add_foreign_key "blog_post_categories", "blog_posts"
  add_foreign_key "blog_posts", "author_blogs"
  add_foreign_key "rentings", "users"
end
