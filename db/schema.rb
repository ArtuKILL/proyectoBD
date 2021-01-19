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

ActiveRecord::Schema.define(version: 2021_01_19_075024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_p_hist", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
    t.date "fecha_final"
  end

  create_table "agencias_rallies", id: false, force: :cascade do |t|
    t.integer "cupos", limit: 2
  end

  create_table "agencies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.serial "id_agencia", null: false
    t.string "nombre_agencia", limit: 35, null: false
    t.string "url", limit: 100, null: false
    t.string "alcance", limit: 15, null: false
    t.text "descripcion", null: false
    t.string "tipo", limit: 20, null: false
    t.check_constraint "(alcance)::text = ANY (ARRAY[('Local'::character varying)::text, ('Nacional'::character varying)::text, ('Internacional'::character varying)::text])", name: "alcance_a"
    t.check_constraint "(tipo)::text = ANY (ARRAY[('Tour Operadoras'::character varying)::text, ('Mayoristas'::character varying)::text, ('Minoristas'::character varying)::text, ('Mixta'::character varying)::text])", name: "tipo_a"
  end

  create_table "alojamientos_hoteles", primary_key: "id_hotel", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_hotel", null: false
  end

  create_table "ap_hist", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
    t.date "fecha_final"
    t.bigint "id_proveedor", null: false
    t.bigint "id_agencia", null: false
  end

  create_table "area_intereses", primary_key: "id_interes", id: :bigint, default: nil, force: :cascade do |t|
    t.string "categoria_interes", null: false
    t.text "descripcion_interes"
  end

  create_table "areaint_es", primary_key: "id_areaint_esp", id: :bigint, default: nil, force: :cascade do |t|
    t.text "comentario"
  end

  create_table "asesores", primary_key: "id_asesor", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_asesor", null: false
    t.string "seg_nombre_asesor"
    t.string "apellido_asesor", null: false
    t.string "seg_apellido_asesor", null: false
  end

  create_table "atracciones", primary_key: "id_atraccion", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_atraccion", null: false
    t.text "descripcion_atrac", null: false
  end

  create_table "atracciones_circuitos", id: false, force: :cascade do |t|
    t.bigint "id_atraccion", null: false
    t.string "orden_circuito", limit: 1, null: false
  end

  create_table "bancos", force: :cascade do |t|
    t.string "nombre_banco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "calendarios_anuales", primary_key: "fecha_salida", id: :date, force: :cascade do |t|
    t.text "descripcion"
  end

  create_table "circuitos", primary_key: "orden", id: :string, force: :cascade do |t|
    t.string "max_dias", null: false
  end

  create_table "ciudades_localidades", primary_key: "id_ciudad", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_ciudad", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "id_natrif"
    t.string "nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "genero"
    t.date "fecha_nac"
    t.string "direccion"
    t.string "tipo"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "detalles_servicios", primary_key: "id_servicio", id: :bigint, default: nil, force: :cascade do |t|
    t.string "tipo", null: false
    t.text "descripcion", null: false
    t.string "comida"
  end

  create_table "empresa_prooveedor", primary_key: "id_proveedor", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_proveedor", limit: 40, null: false
    t.string "tipo_proveedor", null: false
  end

  create_table "forma_pagos", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hist_precios", primary_key: "fecha_inicio", id: :date, force: :cascade do |t|
    t.date "fecha_final"
    t.integer "precio_base", null: false
  end

  create_table "itinerarios", id: false, force: :cascade do |t|
    t.integer "tiempo_estadia", limit: 2, null: false
    t.text "descripcion", null: false
  end

  create_table "itinerarios_atracciones", id: false, force: :cascade do |t|
    t.integer "orden", limit: 2
  end

  create_table "metodos_pago", primary_key: "id_metodo", force: :cascade do |t|
    t.string "tipo"
    t.string "numero"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ofertas", primary_key: "id_oferta", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_oferta", limit: 40, null: false
    t.integer "porcentaje", limit: 2, null: false
    t.string "tipo_persona", limit: 20, null: false
    t.date "fecha_inicial", null: false
    t.date "fecha_final"
  end

  create_table "paises", primary_key: "id_pais", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_pais", null: false
    t.string "continente", limit: 10, null: false
    t.string "region", null: false
    t.string "nacionalidad", limit: 20, null: false
  end

  create_table "paquete_contratos", force: :cascade do |t|
    t.integer "nro_presupuesto"
    t.date "fecha_emision"
    t.decimal "total_calculado"
    t.date "fecha_salida"
    t.integer "nro_factura"
    t.string "email_contacto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paquetes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre_paquete", limit: 60, null: false
    t.text "descripcion", null: false
    t.integer "cant_personas", limit: 2, null: false
    t.integer "duracion_dias", limit: 2, null: false
  end

  create_table "participantes", primary_key: "id_participante", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "nro_equipo", limit: 2
    t.integer "posicion", limit: 2
  end

  create_table "pasaportes", primary_key: "num_pasaporte", id: :string, force: :cascade do |t|
  end

  create_table "premios", primary_key: "id_premio", id: :bigint, default: nil, force: :cascade do |t|
    t.string "nombre_premio", null: false
    t.string "puesto", null: false
    t.text "descripcion", null: false
  end

  create_table "rallies", force: :cascade do |t|
    t.date "created_at", null: false
    t.string "nombre_rally", null: false
    t.date "fecha_final", null: false
    t.integer "precio_rally", limit: 2
    t.string "tipo", null: false
    t.integer "cupos_totales", limit: 2, null: false
  end

  create_table "registro_clientes", force: :cascade do |t|
    t.integer "nro_registro"
    t.date "fecha_registro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registros_viajero", primary_key: "nro_registro", force: :cascade do |t|
    t.date "fecha_registro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "socios", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
    t.date "fecha_final"
  end

  create_table "tipos", force: :cascade do |t|
    t.string "numero"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "valoraciones", primary_key: "id_valoracion", id: :bigint, default: nil, force: :cascade do |t|
    t.string "tipo", null: false
    t.string "pais_favorito", null: false
    t.string "ciudad_favorita", null: false
    t.string "atraccion_favorita", null: false
  end

  create_table "viajeros", primary_key: "id_viajero", force: :cascade do |t|
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "genero"
    t.date "fecha_nacimiento"
    t.string "correo_viajero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
