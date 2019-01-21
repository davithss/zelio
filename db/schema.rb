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

ActiveRecord::Schema.define(version: 2019_01_14_124550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "realized_at"
  end

  create_table "attendances_klasses", id: false, force: :cascade do |t|
    t.bigint "attendance_id", null: false
    t.bigint "klass_id", null: false
    t.index ["attendance_id", "klass_id"], name: "index_attendances_klasses_on_attendance_id_and_klass_id"
    t.index ["klass_id", "attendance_id"], name: "index_attendances_klasses_on_klass_id_and_attendance_id"
  end

  create_table "attendances_students", id: false, force: :cascade do |t|
    t.bigint "attendance_id", null: false
    t.bigint "student_id", null: false
    t.index ["attendance_id", "student_id"], name: "index_attendances_students_on_attendance_id_and_student_id"
    t.index ["student_id", "attendance_id"], name: "index_attendances_students_on_student_id_and_attendance_id"
  end

  create_table "justifications", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pendente"
    t.string "upload_file_name"
    t.string "upload_content_type"
    t.bigint "upload_file_size"
    t.datetime "upload_updated_at"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "klasses_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "klass_id", null: false
    t.index ["klass_id", "student_id"], name: "index_klasses_students_on_klass_id_and_student_id"
    t.index ["student_id", "klass_id"], name: "index_klasses_students_on_student_id_and_klass_id"
  end

  create_table "klasses_teachers", id: false, force: :cascade do |t|
    t.bigint "klass_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["klass_id", "teacher_id"], name: "index_klasses_teachers_on_klass_id_and_teacher_id"
    t.index ["teacher_id", "klass_id"], name: "index_klasses_teachers_on_teacher_id_and_klass_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attended"
    t.boolean "active", default: true
    t.datetime "disabled_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
