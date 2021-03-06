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

ActiveRecord::Schema.define(:version => 20111230212936) do

  create_table "add_phone_no_to_students", :force => true do |t|
    t.integer  "phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "line_one"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "address_line_one"
    t.integer  "hostel_id"
    t.string   "status"
  end

  create_table "advance_bookings", :force => true do |t|
    t.integer  "bed_id"
    t.integer  "amount"
    t.date     "allocation_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transection_id"
  end

  create_table "beds", :force => true do |t|
    t.string   "position"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "security_guard"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "contact_us", :force => true do |t|
    t.string   "email"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floors", :force => true do |t|
    t.string   "name"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hostels", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact_no"
    t.integer  "address_id"
    t.string   "food_service"
    t.float    "standard_level"
    t.text     "notes"
    t.integer  "representative_id"
    t.date     "data_collection_date"
    t.string   "varification_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "hostel_type"
    t.string   "status"
  end

  create_table "random_reminders", :force => true do |t|
    t.date     "for_date"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "floor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.integer  "hostel_id"
    t.integer  "total_seats"
    t.integer  "vacant_seats"
    t.integer  "sharing"
    t.integer  "rent_amount"
    t.integer  "caution_deposite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "qualification"
    t.string   "purpose_of_visit"
    t.string   "permanent_address"
    t.integer  "monthly_rent"
    t.integer  "advance_amount"
    t.string   "comment"
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bed_id"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_size"
    t.string   "document_photo_file_name"
    t.string   "document_photo_content_type"
    t.integer  "document_photo_size"
    t.date     "leaving_date"
    t.string   "status"
    t.integer  "work_phone_no",               :limit => 8
    t.integer  "phone_no",                    :limit => 8
    t.string   "email"
  end

  create_table "transections", :force => true do |t|
    t.string   "rent_month"
    t.string   "details"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "owner_id"
    t.string   "mode"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacating_notices", :force => true do |t|
    t.integer  "student_id"
    t.integer  "roomt_id"
    t.date     "exit_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bed_id"
  end

end
