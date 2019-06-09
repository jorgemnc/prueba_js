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

ActiveRecord::Schema.define(version: 2019_06_09_231257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.string "movimiento"
    t.date "inicio"
    t.date "termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reason_for_non_attendance_id"
    t.index ["reason_for_non_attendance_id"], name: "index_attendances_on_reason_for_non_attendance_id"
  end

  create_table "reason_for_non_attendances", force: :cascade do |t|
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.date "fecha_nacimiento"
    t.string "sexo"
    t.string "estado_civil"
    t.string "nacionalidad"
    t.string "direccion"
    t.string "region"
    t.string "comuna"
    t.string "telefono"
    t.string "imagen"
    t.string "tipo_contrato"
    t.integer "dias_de_trabajo"
    t.integer "horas_diarias"
    t.integer "horas_semanales"
    t.integer "sueldo_base"
    t.integer "cargas_simples", default: 0
    t.integer "cargas_invalidas", default: 0
    t.integer "cargas_materiales", default: 0
    t.integer "cargas_retroactivas", default: 0
    t.integer "bono_movilizacion", default: 0
    t.integer "bono_colacion", default: 0
    t.integer "seguro_cesantia", default: 1
    t.date "inicio_cotizacion_afp"
    t.integer "subsidio_trabajador_joven", default: 0
    t.integer "promedio_immponible_cargas_familiares", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "reason_for_non_attendances"
end
