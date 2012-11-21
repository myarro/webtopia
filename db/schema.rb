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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121120232526) do

  create_table "blogs", :force => true do |t|
    t.string   "subject"
    t.string   "body"
    t.string   "tags"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "topic_1"
    t.string   "topic_2"
    t.string   "topic_3"
    t.string   "topic_4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "list_name"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section1"
    t.string   "section2"
    t.string   "section3"
    t.string   "section4"
    t.string   "page_name"
    t.string   "page_layout"
    t.string   "url"
    t.string   "header_special"
    t.integer  "col_layout"
    t.string   "col1_1"
    t.string   "col1_2"
    t.string   "col1_3"
    t.string   "col1_4"
    t.string   "col2_1"
    t.string   "col2_2"
    t.string   "col2_3"
    t.string   "col2_4"
    t.string   "col3_1"
    t.string   "col3_2"
    t.string   "col3_3"
    t.string   "col3_4"
    t.string   "col4_1"
    t.string   "col4_2"
    t.string   "col4_3"
    t.string   "col4_4"
    t.string   "canonical_url"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "permission"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_access_time"
    t.string   "last_access"
    t.string   "logged_in"
    t.integer  "home_page"
  end

  create_table "website_settings", :force => true do |t|
    t.integer  "session_time_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_page"
  end

end
