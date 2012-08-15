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

ActiveRecord::Schema.define(:version => 20120812095547) do

  create_table "ad_man_advertisements", :force => true do |t|
    t.string   "title"
    t.string   "destination_url"
    t.string   "ad_banner_file_name"
    t.string   "ad_banner_content_type"
    t.integer  "ad_banner_file_size"
    t.datetime "ad_banner_updated_at"
    t.integer  "display_count",          :default => 0, :null => false
    t.integer  "priority",               :default => 1, :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "keyword_id"
    t.integer  "click_count",            :default => 0, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "ad_man_keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
