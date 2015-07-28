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

ActiveRecord::Schema.define(version: 20150727175913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "empresa_id"
    t.integer  "user_id"
    t.integer  "visit_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reports", ["department_id"], name: "index_reports_on_department_id", using: :btree
  add_index "reports", ["empresa_id"], name: "index_reports_on_empresa_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree
  add_index "reports", ["visit_id"], name: "index_reports_on_visit_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.integer  "rg"
    t.integer  "cpf"
    t.integer  "matricula"
    t.integer  "Department_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "name"
    t.integer  "rg"
    t.integer  "cpf"
    t.integer  "department_id"
    t.integer  "user_id"
    t.datetime "entrada"
    t.datetime "saida"
    t.integer  "empresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "visits", ["department_id"], name: "index_visits_on_department_id", using: :btree
  add_index "visits", ["empresa_id"], name: "index_visits_on_empresa_id", using: :btree
  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  add_foreign_key "reports", "departments"
  add_foreign_key "reports", "empresas"
  add_foreign_key "reports", "users"
  add_foreign_key "reports", "visits"
  add_foreign_key "visits", "departments"
  add_foreign_key "visits", "empresas"
  add_foreign_key "visits", "users"
end
