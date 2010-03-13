# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100313143351) do

  create_table "events", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "location",    :default => "", :null => false
    t.datetime "start_at",                    :null => false
    t.datetime "end_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email",                              :null => false
    t.string   "encrypted_password",   :limit => 40, :null => false
    t.string   "password_salt",                      :null => false
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.string   "reset_password_token", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
