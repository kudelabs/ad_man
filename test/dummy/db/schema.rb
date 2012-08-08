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

ActiveRecord::Schema.define(:version => 20120808085909) do

  create_table "ad_man_advertisements", :force => true do |t|
    t.string   "title"
    t.string   "destination_url"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "ad_banner_file_name"
    t.string   "ad_banner_content_type"
    t.integer  "ad_banner_file_size"
    t.datetime "ad_banner_updated_at"
  end

end
