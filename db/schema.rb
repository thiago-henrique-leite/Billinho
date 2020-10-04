# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_21_192017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.decimal "bill_amount"
    t.date "due_date"
    t.bigint "enrollment_id"
    t.text "status"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enrollment_id"], name: "index_bills_on_enrollment_id"
    t.index ["student_id"], name: "index_bills_on_student_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.decimal "total_value"
    t.integer "ammount_bills"
    t.integer "due_day"
    t.text "course"
    t.bigint "institution_id"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_enrollments_on_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.text "name"
    t.text "cnpj"
    t.text "kind"
    t.text "cep"
    t.text "address"
    t.text "state"
    t.text "neighborhood"
    t.text "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnpj"], name: "index_institutions_on_cnpj", unique: true
    t.index ["name"], name: "index_institutions_on_name", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.text "name"
    t.text "cpf"
    t.date "birth_date"
    t.integer "phone"
    t.text "gender"
    t.text "pay_method"
    t.text "cep"
    t.text "address"
    t.text "state"
    t.text "neighborhood"
    t.text "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
    t.index ["name"], name: "index_students_on_name", unique: true
  end

end
