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

ActiveRecord::Schema.define(version: 2020_06_07_233740) do

  create_table "line_items", force: :cascade do |t|
    t.string "department"
    t.string "division"
    t.string "dept"
    t.string "department_alias"
    t.string "service_area"
    t.string "service_area_alias"
    t.string "fund"
    t.string "fund_and_desc"
    t.string "org"
    t.string "org_and_desc"
    t.string "project"
    t.string "project_and_desc"
    t.string "prog"
    t.string "prog_and_desc"
    t.string "account_type"
    t.string "rev_or_exp"
    t.string "acct_and_desc"
    t.string "category"
    t.integer "acct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fy18_19_midcycle_adopted_total"
    t.integer "fy19_20_biennial_working_total"
    t.integer "fy20_21_biennial_working_total"
  end

end
