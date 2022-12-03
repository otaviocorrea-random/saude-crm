# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_03_023343) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "complemento"
    t.bigint "municipio_id", null: false
    t.bigint "municipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipe_id"], name: "index_enderecos_on_municipe_id", unique: true
    t.index ["municipio_id"], name: "index_enderecos_on_municipio_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "sigla", limit: 2, null: false
    t.string "nome", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_estados_on_nome", unique: true
    t.index ["sigla"], name: "index_estados_on_sigla", unique: true
  end

  create_table "municipes", force: :cascade do |t|
    t.string "nome_completo"
    t.string "cpf", limit: 14, null: false
    t.string "cns", null: false
    t.string "email", limit: 100, null: false
    t.date "data_nascimento", null: false
    t.string "telefone", limit: 20, null: false
    t.string "foto", null: false
    t.integer "status", default: 0, null: false
    t.bigint "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_municipes_on_cpf", unique: true
    t.index ["email"], name: "index_municipes_on_email", unique: true
    t.index ["municipio_id"], name: "index_municipes_on_municipio_id"
  end

  create_table "municipios", force: :cascade do |t|
    t.string "nome", limit: 100, null: false
    t.bigint "estado_id", null: false
    t.string "codigo_ibge", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo_ibge"], name: "index_municipios_on_codigo_ibge", unique: true
    t.index ["estado_id"], name: "index_municipios_on_estado_id"
    t.index ["nome", "estado_id"], name: "index_municipios_on_nome_and_estado_id", unique: true
  end

  add_foreign_key "enderecos", "municipes"
  add_foreign_key "enderecos", "municipios"
  add_foreign_key "municipes", "municipios"
  add_foreign_key "municipios", "estados"
end
