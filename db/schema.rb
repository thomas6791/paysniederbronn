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

ActiveRecord::Schema.define(version: 2019_10_17_185553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["author_blog_id"], name: "index_blog_posts_on_author_blog_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holiday_rentings", force: :cascade do |t|
    t.string "name"
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
  end

  create_table "post_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_post_categories_on_article_id"
    t.index ["category_id"], name: "index_post_categories_on_category_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "blog_post_categories", "blog_categories"
  add_foreign_key "blog_post_categories", "blog_posts"
  add_foreign_key "blog_posts", "author_blogs"
end
