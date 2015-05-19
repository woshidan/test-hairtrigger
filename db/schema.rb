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

ActiveRecord::Schema.define(version: 20150519160009) do

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_trigger("users_before_insert_row_when_select_count_from_users_where_n_tr", :generated => true, :compatibility => 1).
      on("users").
      before(:insert).
      where("(SELECT COUNT(*) FROM users where name = NEW.name) > 0") do
    "SET NEW.name = CONCAT(NEW.name, (SELECT COUNT(*) FROM users where name = NEW.name) + 1);"
  end

end
