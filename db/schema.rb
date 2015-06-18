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

ActiveRecord::Schema.define(version: 20150610191506) do

  create_table "consents", force: :cascade do |t|
    t.integer  "cuota"
    t.text     "acuerdo"
    t.integer  "duracion"
    t.text     "medicamentos"
    t.string   "encargado"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "internals", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "sexo"
    t.string   "f_nacimiento"
    t.integer  "edad"
    t.text     "dir"
    t.string   "tel"
    t.string   "nacionalidad"
    t.string   "estado_civil"
    t.string   "escolaridad"
    t.string   "ocupacion"
    t.string   "ingreso_prev"
    t.string   "referencia"
    t.string   "tipo_ingreso"
    t.text     "motivo"
    t.text     "stado"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "representatives", force: :cascade do |t|
    t.string   "nombre_rep"
    t.string   "apellido_rep"
    t.integer  "edad"
    t.string   "parentesco"
    t.text     "dir_rep"
    t.string   "tel_1"
    t.string   "tel_2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "id_internal"
    t.string   "nombre"
    t.integer  "num_pago"
    t.integer  "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "valuations", force: :cascade do |t|
    t.integer  "id_internal"
    t.string   "nombre"
    t.text     "padecimiento"
    t.text     "sintoma"
    t.text     "trat_prev"
    t.integer  "TA"
    t.integer  "FC"
    t.integer  "FR"
    t.integer  "TEMP"
    t.integer  "peso"
    t.integer  "talla"
    t.text     "ex_aus"
    t.text     "exa_ment"
    t.text     "diagnostico"
    t.text     "pronostico"
    t.text     "trat_sug"
    t.string   "medico"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
