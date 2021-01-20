class AddTablesPt4 < ActiveRecord::Migration[6.1]
  def change
    create_table "agencias_rallies", id: false, force: :cascade do |t|
      t.integer "cupos", limit: 2
      t.bigint "id_agencia", null: false
      t.bigint "id_rally", null: false
    end

    create_table "agencies", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "nombre_agencia", limit: 35, null: false
      t.string "url", limit: 100, null: false
      t.string "alcance", limit: 15, null: false
      t.text "descripcion", null: false
      t.string "tipo", limit: 20, null: false
      t.check_constraint "(alcance)::text = ANY ((ARRAY['Local'::character varying, 'Nacional'::character varying, 'Internacional'::character varying])::text[])", name: "alcance_a"
      t.check_constraint "(tipo)::text = ANY ((ARRAY['Tour Operadoras'::character varying, 'Mayoristas'::character varying, 'Minoristas'::character varying, 'Mixta'::character varying])::text[])", name: "tipo_a"
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
      t.index ["categoria_interes"], name: "categoria_int", unique: true
    end

    create_table "areaint_es", primary_key: "id_areaint_esp", id: :bigint, default: nil, force: :cascade do |t|
      t.text "comentario"
      t.bigint "id_interes", null: false
      t.bigint "id_asesor", null: false
      t.bigint "id_atraccion", null: false
      t.bigint "id_paquete", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "asesores", primary_key: "id_asesor", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_asesor", null: false
      t.string "seg_nombre_asesor"
      t.string "apellido_asesor", null: false
      t.string "seg_apellido_asesor", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "atracciones", primary_key: "id_atraccion", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_atraccion", null: false
      t.text "descripcion_atrac", null: false
      t.bigint "id_ciudad", null: false
      t.index ["nombre_atraccion"], name: "nombre_atrac", unique: true
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
      t.bigint "id_paquete", null: false
    end

    create_table "circuitos", primary_key: "orden", id: { type: :string, limit: 1 }, force: :cascade do |t|
      t.string "max_dias", null: false
      t.bigint "id_rally", null: false
      t.bigint "id_ciudad", null: false
      t.index ["orden"], name: "orden_circ", unique: true
    end

    create_table "ciudades_localidades", primary_key: "id_ciudad", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_ciudad", null: false
      t.bigint "id_pais", null: false
    end

    create_table "clientes", primary_key: "id_natriff", id: :bigint, default: nil, force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "nombre", null: false
      t.string "segundo_nombre"
      t.string "primer_apellido"
      t.string "segundo_apellido"
      t.string "genero", limit: 1
      t.date "fecha_nac", null: false
      t.string "direccion", null: false
      t.string "tipo", limit: 1, null: false
      t.index ["email"], name: "index_clientes_on_email", unique: true
      t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
      t.check_constraint "(genero)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text, ('O'::character varying)::text])", name: "genero_cliente"
      t.check_constraint "(tipo)::text = ANY (ARRAY[('N'::character varying)::text, ('J'::character varying)::text])", name: "tipo_cliente"
    end

    create_table "detalles_servicios", primary_key: "id_servicio", id: :bigint, default: nil, force: :cascade do |t|
      t.string "tipo", null: false
      t.text "descripcion", null: false
      t.string "comida"
      t.bigint "id_paquete", null: false
    end

    create_table "empresas_prooveedoras", primary_key: "id_proveedor", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_proveedor", limit: 40, null: false
      t.string "tipo_proveedor", null: false
    end

    create_table "forma_pagos", primary_key: "id_forma", id: :bigint, default: nil, force: :cascade do |t|
      t.string "tipo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "nro_presup", null: false
      t.bigint "id_metodo", null: false
    end

    create_table "hist_precios", primary_key: "fecha_inicio", id: :date, force: :cascade do |t|
      t.date "fecha_final"
      t.integer "precio_base", null: false
      t.bigint "id_paquete", null: false
    end

    create_table "itinerarios", id: false, force: :cascade do |t|
      t.integer "tiempo_estadia", limit: 2, null: false
      t.text "descripcion", null: false
      t.bigint "id_paquete", null: false
      t.bigint "id_ciudad", null: false
    end

    create_table "itinerarios_atracciones", id: false, force: :cascade do |t|
      t.integer "orden", limit: 2
      t.bigint "id_atracciones", null: false
      t.bigint "id_itinerario", null: false
    end

    create_table "metodos_pago", force: :cascade do |t|
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
      t.bigint "id_agencias", null: false
    end

    create_table "paises", primary_key: "id_pais", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_pais", null: false
      t.string "continente", limit: 10, null: false
      t.string "region", null: false
      t.string "nacionalidad", limit: 20, null: false
    end

    create_table "paquete_contratos", primary_key: "nro_presupuesto", id: :bigint, default: nil, force: :cascade do |t|
      t.date "fecha_emision", null: false
      t.decimal "total_calculado", null: false
      t.date "fecha_salida", null: false
      t.integer "nro_factura", null: false
      t.string "email_contacto", null: false
      t.datetime "created_at", precision: 6, null: false
      t.bigint "nro_registro", null: false
      t.bigint "id_paquete", null: false
      t.bigint "id_asesor", null: false
    end

    create_table "paquetes", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "nombre_paquete", limit: 60, null: false
      t.text "descripcion", null: false
      t.integer "cant_personas", limit: 2, null: false
      t.integer "duracion_dias", limit: 2, null: false
      t.bigint "id_agencia", null: false
    end

    create_table "participantes", primary_key: "id_participante", id: :bigint, default: nil, force: :cascade do |t|
      t.integer "nro_equipo", limit: 2
      t.integer "posicion", limit: 2
      t.bigint "id_rally", null: false
      t.bigint "nro_reg", null: false
      t.bigint "id_premio", null: false
      t.bigint "nro_reg_v", null: false
    end

    create_table "pasaportes", primary_key: "num_pasaporte", id: :string, force: :cascade do |t|
      t.bigint "id_pais", null: false
      t.bigint "id_viajero", null: false
    end

    create_table "premios", primary_key: "id_premio", id: :bigint, default: nil, force: :cascade do |t|
      t.string "nombre_premio", null: false
      t.string "puesto", null: false
      t.text "descripcion", null: false
      t.bigint "id_rally", null: false
      t.bigint "id_particpante", null: false
    end

    create_table "rallies", primary_key: "id_rally", id: :bigint, default: nil, force: :cascade do |t|
      t.date "created_at", null: false
      t.string "nombre_rally", null: false
      t.date "fecha_final", null: false
      t.integer "precio_rally", limit: 2
      t.string "tipo", null: false
      t.integer "cupos_totales", limit: 2, null: false
    end

    create_table "registro_clientes", primary_key: "nro_registro", id: :bigint, default: nil, force: :cascade do |t|
      t.date "fecha_registro", null: false
      t.bigint "id_agencia", null: false
      t.bigint "id_natriff", null: false
    end

    create_table "registros_viajeros", primary_key: "nro_registro", id: :bigint, default: nil, force: :cascade do |t|
      t.date "fecha_registro", null: false
      t.bigint "id_viajero", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "servicios_hoteles", id: false, force: :cascade do |t|
      t.bigint "id_servicio", null: false
      t.bigint "id_hotel", null: false
    end

    create_table "socios", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
      t.date "fecha_final"
      t.bigint "id_agencia", null: false
    end

    create_table "valoraciones", primary_key: "id_valoracion", id: :bigint, default: nil, force: :cascade do |t|
      t.string "tipo", null: false
      t.string "pais_favorito", null: false
      t.string "ciudad_favorita", null: false
      t.string "atraccion_favorita", null: false
      t.check_constraint "(tipo)::text = ANY ((ARRAY['L'::character varying, 'A'::character varying])::text[])", name: "valoracion_tipo"
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

    create_table "viajes_compras", id: false, force: :cascade do |t|
      t.bigint "nro_presup", null: false
      t.bigint "nro_reg_v", null: false
    end

    add_foreign_key "agencias_rallies", "agencies", column: "id_agencia", name: "agencia_rallies_fk_a", on_update: :cascade, on_delete: :cascade
    add_foreign_key "agencias_rallies", "rallies", column: "id_rally", primary_key: "id_rally", name: "agencia_rallies_fk_r", on_update: :cascade, on_delete: :cascade
    add_foreign_key "ap_hist", "agencies", column: "id_agencia", name: "hist_agencia_fk", on_update: :cascade, on_delete: :cascade
    add_foreign_key "ap_hist", "empresas_prooveedoras", column: "id_proveedor", primary_key: "id_proveedor", name: "hist_proveedor_fk", on_update: :cascade, on_delete: :cascade
    add_foreign_key "areaint_es", "agencies", column: "id_agencia", name: "agencia_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "areaint_es", "area_intereses", column: "id_interes", primary_key: "id_interes", name: "area_int_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "areaint_es", "asesores", column: "id_asesor", primary_key: "id_asesor", name: "asesor_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "areaint_es", "atracciones", column: "id_atraccion", primary_key: "id_atraccion", name: "atraccion_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "areaint_es", "paquetes", column: "id_paquete", name: "paquete_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "asesores", "agencies", column: "id_agencia", name: "agencias_asesor_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "atracciones", "ciudades_localidades", column: "id_ciudad", primary_key: "id_ciudad", name: "atracciones_ciudades_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "atracciones_circuitos", "atracciones", column: "id_atraccion", primary_key: "id_atraccion", name: "atracciones_fk", on_update: :cascade, on_delete: :cascade
    add_foreign_key "atracciones_circuitos", "circuitos", column: "orden_circuito", primary_key: "orden", name: "circuitos_fk", on_update: :cascade, on_delete: :cascade
    add_foreign_key "calendarios_anuales", "paquetes", column: "id_paquete", name: "paquete_calendario_fk", on_update: :cascade, on_delete: :cascade
    add_foreign_key "circuitos", "rallies", column: "id_rally", primary_key: "id_rally", name: "rallies_circuitos_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "ciudades_localidades", "paises", column: "id_pais", primary_key: "id_pais", name: "paises_ciudades_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "detalles_servicios", "paquetes", column: "id_paquete", name: "detalles_paquete_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "forma_pagos", "metodos_pago", column: "id_metodo", name: "metodos_formas_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "forma_pagos", "paquete_contratos", column: "nro_presup", primary_key: "nro_presupuesto", name: "contrato_pago_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "hist_precios", "paquetes", column: "id_paquete", name: "paquetes_precios_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "itinerarios", "ciudades_localidades", column: "id_ciudad", primary_key: "id_ciudad", name: "ciudades_itinerarios_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "itinerarios", "paquetes", column: "id_paquete", name: "paquete_itinerario_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "itinerarios_atracciones", "atracciones", column: "id_atracciones", primary_key: "id_atraccion", name: "atracciones_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "ofertas", "agencies", column: "id_agencias", name: "ofertas_agencias_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "paquete_contratos", "asesores", column: "id_asesor", primary_key: "id_asesor", name: "contrato_asesor_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "paquete_contratos", "paquetes", column: "id_paquete", name: "paquete_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "paquete_contratos", "registro_clientes", column: "nro_registro", primary_key: "nro_registro", name: "contrato_clientes_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "paquetes", "agencies", column: "id_agencia", name: "paquete_agencia_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "participantes", "rallies", column: "id_rally", primary_key: "id_rally", name: "rally_participante_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "participantes", "registro_clientes", column: "nro_reg", primary_key: "nro_registro", name: "participante_cliente_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "pasaportes", "paises", column: "id_pais", primary_key: "id_pais", name: "pais_pasap_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "pasaportes", "viajeros", column: "id_viajero", primary_key: "id_viajero", name: "viajero_pasap_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "premios", "participantes", column: "id_particpante", primary_key: "id_participante", name: "participante_premio_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "premios", "rallies", column: "id_rally", primary_key: "id_rally", name: "rally_premio_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "registro_clientes", "agencies", column: "id_agencia", name: "agencia_cliente_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "registro_clientes", "clientes", column: "id_natriff", primary_key: "id_natriff", name: "cliente_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "registros_viajeros", "agencies", column: "id_agencia", name: "agencia_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "registros_viajeros", "viajeros", column: "id_viajero", primary_key: "id_viajero", name: "viajero_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "servicios_hoteles", "alojamientos_hoteles", column: "id_servicio", primary_key: "id_hotel", name: "hotel_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "servicios_hoteles", "detalles_servicios", column: "id_servicio", primary_key: "id_servicio", name: "servicio_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "socios", "agencies", column: "id_agencia", name: "socios_agencias_fk", on_update: :cascade, on_delete: :restrict
    add_foreign_key "viajes_compras", "paquete_contratos", column: "nro_presup", primary_key: "nro_presupuesto", name: "contrato_fk", on_update: :cascade, on_delete: :restrict
  end
end
