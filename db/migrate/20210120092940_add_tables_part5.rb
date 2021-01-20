class AddTablesPart5  < ActiveRecord::Migration[6.1]
  def change
    create_table "aci_agencias_rallies", id: false, force: :cascade do |t|
        t.integer "cupos", limit: 2
        t.bigint "id_agencia", null: false
        t.bigint "id_rally", null: false
    end

    create_table "aci_agencies", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('agencies_id_seq'::regclass)" }
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

    create_table "aci_alojamientos_hoteles", primary_key: "id_hotel", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('alojamientos_hoteles_id_seq'::regclass)" }
      t.string "nombre_hotel", null: false
    end

    create_table "aci_ap_hist", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
      t.date "fecha_final"
      t.bigint "id_proveedor", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "aci_area_intereses", primary_key: "id_interes", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('area_intereses_id_seq'::regclass)" }
      t.string "categoria_interes", null: false
      t.text "descripcion_interes"
      t.index ["categoria_interes"], name: "categoria_int", unique: true
    end

    create_table "aci_areaint_es", primary_key: "id_areaint_esp", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('areaint_es_id_seq'::regclass)" }
      t.text "comentario"
      t.bigint "id_interes", null: false
      t.bigint "id_asesor", null: false
      t.bigint "id_atraccion", null: false
      t.bigint "id_paquete", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "aci_asesores", primary_key: "id_asesor", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('asesores_id_seq'::regclass)" }
      t.string "nombre_asesor", null: false
      t.string "seg_nombre_asesor"
      t.string "apellido_asesor", null: false
      t.string "seg_apellido_asesor", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "aci_atracciones", primary_key: "id_atraccion", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('atracciones_id_seq'::regclass)" }
      t.string "nombre_atraccion", null: false
      t.text "descripcion_atrac", null: false
      t.bigint "id_ciudad", null: false
      t.index ["nombre_atraccion"], name: "nombre_atrac", unique: true
    end

    create_table "aci_atracciones_circuitos", id: false, force: :cascade do |t|
      t.bigint "id_atraccion", null: false
      t.string "orden_circuito", limit: 1, null: false
    end

    create_table "aci_bancos", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('bancos_id_seq'::regclass)" }
      t.string "nombre_banco"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "aci_calendarios_anuales", primary_key: "fecha_salida", id: :date, force: :cascade do |t|
      t.text "descripcion"
      t.bigint "id_paquete", null: false
    end

    create_table "aci_circuitos", primary_key: "orden", id: { type: :string, limit: 1, force: :cascade} do |t| #, default: -> { "nextval('circuitos_id_seq'::regclass)" } }
      t.string "max_dias", null: false
      t.bigint "id_rally", null: false
      t.bigint "id_ciudad", null: false
      t.index ["orden"], name: "orden_circ", unique: true
    end

    create_table "aci_ciudades_localidades", primary_key: "id_ciudad", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('ciudades_localidades_id_seq'::regclass)" }
      t.string "nombre_ciudad", null: false
      t.bigint "id_pais", null: false
    end

    create_table "aci_clientes", primary_key: "id_natriff", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('clientes_id_seq'::regclass)" }
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
      #t.index ["email"], name: "index_clientes_on_email", unique: true
    # t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
      t.check_constraint "(genero)::text = ANY (ARRAY[('M'::character varying)::text, ('F'::character varying)::text, ('O'::character varying)::text])", name: "genero_cliente"
      t.check_constraint "(tipo)::text = ANY (ARRAY[('N'::character varying)::text, ('J'::character varying)::text])", name: "tipo_cliente"
    end

    create_table "aci_detalles_servicios", primary_key: "id_servicio", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('detalles_servicios_id_seq'::regclass)" }
      t.string "tipo", null: false
      t.text "descripcion", null: false
      t.string "comida"
      t.bigint "id_paquete", null: false
    end

    create_table "aci_empresas_proveedoras", primary_key: "id_proveedor", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('empresas_proveedoras_id_seq'::regclass)" }
      t.string "nombre_proveedor", limit: 40, null: false
      t.string "tipo_proveedor", null: false
    end

    create_table "aci_forma_pagos", primary_key: "id_forma", force: :cascade do |t| #, id: :bigint, default: -> { "nextval('forma_pagos_id_seq'::regclass)" }
      t.string "tipo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "nro_presup", null: false
      t.bigint "id_metodo", null: false
      t.check_constraint "(tipo)::text = ANY ((ARRAY['TarjetaC'::character varying, 'TarjetaD'::character varying, 'Cta'::character varying, 'Zelle'::character varying])::text[])", name: "tipo_c"
    end

    create_table "aci_hist_precios", primary_key: "fecha_inicio", id: :date, force: :cascade do |t|
      t.date "fecha_final"
      t.integer "precio_base", null: false
      t.bigint "id_paquete", null: false
    end

    create_table "aci_itinerarios", primary_key: ["id_paquetes", "id_ciudades"], force: :cascade do |t|
      t.integer "tiempo_estadia", limit: 2, null: false
      t.text "descripcion", null: false
      t.bigint "id_paquetes", null: false
      t.bigint "id_ciudades", null: false
    end

    create_table "aci_itinerarios_atracciones", id: false, force: :cascade do |t|
      t.integer "orden", limit: 2
      t.bigint "id_atracciones", null: false
      t.bigint "id_itinerario_p", null: false
      t.bigint "id_itinerario_c", null: false
    end

    create_table "aci_metodos_pago", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('metodos_pago_id_seq'::regclass)" }
      t.string "numero"
      t.string "email"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "aci_ofertas", primary_key: "id_oferta", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('ofertas_id_seq'::regclass)" }
      t.string "nombre_oferta", limit: 40, null: false
      t.integer "porcentaje", limit: 2, null: false
      t.string "tipo_persona", limit: 20, null: false
      t.date "fecha_inicial", null: false
      t.date "fecha_final"
      t.bigint "id_agencias", null: false
      t.check_constraint "(tipo_persona)::text = ANY ((ARRAY['Adultos'::character varying, 'Niños'::character varying, 'Tercera Edad'::character varying])::text[])", name: "tipo_persona_c"
    end

    create_table "aci_paises", primary_key: "id_pais", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('paises_id_seq'::regclass)" }
      t.string "nombre_pais", null: false
      t.string "continente", limit: 10, null: false
      t.string "region", null: false
      t.string "nacionalidad", limit: 20, null: false
    end

    create_table "aci_paquete_contratos", primary_key: "nro_presupuesto", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('paquete_contratos_id_seq'::regclass)" }
      t.date "fecha_emision", null: false
      t.decimal "total_calculado", null: false
      t.date "fecha_salida", null: false
      t.integer "nro_factura", null: false #, default: -> { "nextval('paquete_contratos_fact_seq'::regclass)" }
      t.string "email_contacto", null: false
      t.datetime "created_at", precision: 6, null: false
      t.bigint "nro_registro", null: false
      t.bigint "id_paquete", null: false
      t.bigint "id_asesor", null: false
    end

    create_table "aci_paquetes", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('paquetes_id_seq'::regclass)" }
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "nombre_paquete", limit: 60, null: false
      t.text "descripcion", null: false
      t.integer "cant_personas", limit: 2, null: false
      t.integer "duracion_dias", limit: 2, null: false
      t.bigint "id_agencia", null: false
    end

    create_table "aci_participantes", primary_key: "id_participante", id: :bigint, force: :cascade do |t| # , default: -> { "nextval('participantes_id_seq'::regclass)" }
      t.integer "nro_equipo", limit: 2
      t.integer "posicion", limit: 2
      t.bigint "id_rally", null: false
      t.bigint "nro_reg", null: false
      t.bigint "id_premio", null: false
      t.bigint "nro_reg_v", null: false
    end

    create_table "aci_pasaportes", primary_key: "num_pasaporte", id: :string, force: :cascade do |t|
      t.bigint "id_pais", null: false
      t.bigint "id_viajero", null: false
    end

    create_table "aci_premios", primary_key: "id_premio", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('premios_id_seq'::regclass)" }
      t.string "nombre_premio", null: false
      t.string "puesto", null: false
      t.text "descripcion", null: false
      t.bigint "id_rally", null: false
      t.bigint "id_particpante", null: false
    end

    create_table "aci_rallies", primary_key: "id_rally", id: :bigint, force: :cascade do |t| #default: -> { "nextval('rallies_id_seq'::regclass)" }
      t.date "created_at", null: false
      t.string "nombre_rally", null: false
      t.date "fecha_final", null: false
      t.integer "precio_rally", limit: 2
      t.string "tipo", null: false
      t.integer "cupos_totales", limit: 2, null: false
    end

    create_table "aci_registro_clientes", primary_key: "nro_registro", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('registro_clientes_id_seq'::regclass)" }
      t.date "fecha_registro", null: false
      t.bigint "id_agencia", null: false
      t.bigint "id_natriff", null: false
    end

    create_table "aci_registros_viajeros", primary_key: "nro_registro", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('registros_viajeros_id_seq'::regclass)" }
      t.date "fecha_registro", null: false
      t.bigint "id_viajero", null: false
      t.bigint "id_agencia", null: false
    end

    create_table "aci_servicios_hoteles", id: false, force: :cascade do |t|
      t.bigint "id_servicio", null: false #, default: -> { "nextval('servicios_hoteles_id_seq'::regclass)" } #FIXME: Arreglar
      t.bigint "id_hotel", null: false
    end

    create_table "aci_socios", primary_key: "fecha_inicial", id: :date, force: :cascade do |t|
      t.date "fecha_final"
      t.bigint "agency_id", null: false
      t.bigint "agencia1_id"
      t.bigint "agencia2_id"
      t.index ["agencia1_id"], name: "index_socios_on_agencia1_id"
      t.index ["agencia2_id"], name: "index_socios_on_agencia2_id"
      t.index ["agency_id"], name: "index_socios_on_agency_id"
    end

    create_table "aci_valoraciones", primary_key: "id_valoracion", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('valoraciones_id_seq'::regclass)" }
      t.string "pais_favorito", null: false
      t.string "ciudad_favorita", null: false
      t.string "atraccion_favorita", null: false
      t.string "tipo", limit: 1, null: false
      t.bigint "nro_presup"
      t.bigint "id_rally"
      t.bigint "id_atraccion"
      t.bigint "id_pais"
      t.bigint "id_ciudad"
      t.check_constraint "tipo = ANY (ARRAY['P'::bpchar, 'C'::bpchar, 'A'::bpchar])", name: "tipo_c"
    end

    create_table "aci_viajeros", primary_key: "id_viajero", id: :bigint, force: :cascade do |t| #, default: -> { "nextval('viajeros_id_viajero_seq'::regclass)" }
      t.string "primer_nombre", null: false
      t.string "segundo_nombre"
      t.string "primer_apellido", null: false
      t.string "segundo_apellido", null: false
      t.string "genero", null: false
      t.date "fecha_nacimiento", null: false
      t.string "correo_viajero", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.check_constraint "(genero)::text = ANY ((ARRAY['M'::character varying, 'F'::character varying, 'O'::character varying])::text[])", name: "genero_c"
    end

    create_table "aci_viajes_compras", id: false, force: :cascade do |t|
      t.bigint "nro_presup", null: false
      t.bigint "nro_reg_v", null: false
    end

      add_foreign_key "aci_agencias_rallies", "aci_agencies", column: "id_agencia", name: "agencia_rallies_fk_a", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_agencias_rallies", "aci_rallies", column: "id_rally", primary_key: "id_rally", name: "agencia_rallies_fk_r", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_ap_hist", "aci_agencies", column: "id_agencia", name: "hist_agencia_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_ap_hist", "aci_empresas_proveedoras", column: "id_proveedor", primary_key: "id_proveedor", name: "hist_proveedor_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_areaint_es", "aci_agencies", column: "id_agencia", name: "agencia_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_areaint_es", "aci_area_intereses", column: "id_interes", primary_key: "id_interes", name: "area_int_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_areaint_es", "aci_asesores", column: "id_asesor", primary_key: "id_asesor", name: "asesor_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_areaint_es", "aci_atracciones", column: "id_atraccion", primary_key: "id_atraccion", name: "atraccion_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_areaint_es", "aci_paquetes", column: "id_paquete", name: "paquete_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_asesores", "aci_agencies", column: "id_agencia", name: "agencias_asesor_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_atracciones", "aci_ciudades_localidades", column: "id_ciudad", primary_key: "id_ciudad", name: "atracciones_ciudades_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_atracciones_circuitos", "aci_atracciones", column: "id_atraccion", primary_key: "id_atraccion", name: "atracciones_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_atracciones_circuitos", "aci_circuitos", column: "orden_circuito", primary_key: "orden", name: "circuitos_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_calendarios_anuales", "aci_paquetes", column: "id_paquete", name: "paquete_calendario_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_circuitos", "aci_rallies", column: "id_rally", primary_key: "id_rally", name: "rallies_circuitos_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_ciudades_localidades", "aci_paises", column: "id_pais", primary_key: "id_pais", name: "paises_ciudades_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_detalles_servicios", "aci_paquetes", column: "id_paquete", name: "detalles_paquete_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_forma_pagos", "aci_metodos_pago", column: "id_metodo", name: "metodos_formas_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_forma_pagos", "aci_paquete_contratos", column: "nro_presup", primary_key: "nro_presupuesto", name: "contrato_pago_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_hist_precios", "aci_paquetes", column: "id_paquete", name: "paquetes_precios_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_itinerarios", "aci_ciudades_localidades", column: "id_ciudades", primary_key: "id_ciudad", name: "ciudades_itinerarios_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_itinerarios", "aci_paquetes", column: "id_paquetes", name: "paquete_itinerario_fk", on_update: :cascade, on_delete: :restrict
      # FIXME: Arreglar esto tambien
      # add_foreign_key "aci_itinerarios_atracciones", "aci_atracciones", column: "id_atracciones", primary_key: "id_atraccion", name: "atracciones_fk", on_update: :cascade, on_delete: :restrict
      # add_foreign_key "aci_itinerarios_atracciones", "aci_itinerarios", column: "id_itinerario_p", primary_key: "id_paquetes", name: "itinerario_fk", on_update: :cascade
      add_foreign_key "aci_ofertas", "aci_agencies", column: "id_agencias", name: "ofertas_agencias_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_paquete_contratos", "aci_asesores", column: "id_asesor", primary_key: "id_asesor", name: "contrato_asesor_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_paquete_contratos", "aci_paquetes", column: "id_paquete", name: "paquete_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_paquete_contratos", "aci_registro_clientes", column: "nro_registro", primary_key: "nro_registro", name: "contrato_clientes_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_paquetes", "aci_agencies", column: "id_agencia", name: "paquete_agencia_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_participantes", "aci_rallies", column: "id_rally", primary_key: "id_rally", name: "rally_participante_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_participantes", "aci_registro_clientes", column: "nro_reg", primary_key: "nro_registro", name: "participante_cliente_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_pasaportes", "aci_paises", column: "id_pais", primary_key: "id_pais", name: "pais_pasap_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_pasaportes", "aci_viajeros", column: "id_viajero", primary_key: "id_viajero", name: "viajero_pasap_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_premios", "aci_participantes", column: "id_particpante", primary_key: "id_participante", name: "participante_premio_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_premios", "aci_rallies", column: "id_rally", primary_key: "id_rally", name: "rally_premio_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_registro_clientes", "aci_agencies", column: "id_agencia", name: "agencia_cliente_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_registro_clientes", "aci_clientes", column: "id_natriff", primary_key: "id_natriff", name: "cliente_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_registros_viajeros", "aci_agencies", column: "id_agencia", name: "agencia_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_registros_viajeros", "aci_viajeros", column: "id_viajero", primary_key: "id_viajero", name: "viajero_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_servicios_hoteles", "aci_alojamientos_hoteles", column: "id_servicio", primary_key: "id_hotel", name: "hotel_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_servicios_hoteles", "aci_detalles_servicios", column: "id_servicio", primary_key: "id_servicio", name: "servicio_fk", on_update: :cascade, on_delete: :restrict
      # FIXME: revisar esto 
      #add_foreign_key "aci_socios", "aci_agencies", column: "id_agencia", name: "socios_agencias_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_valoraciones", "aci_atracciones", column: "id_atraccion", primary_key: "id_atraccion", name: "valoraciones_atracc_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_valoraciones", "aci_ciudades_localidades", column: "id_ciudad", primary_key: "id_ciudad", name: "valoraciones_ciudades_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_valoraciones", "aci_paises", column: "id_pais", primary_key: "id_pais", name: "valoraciones_pais_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_valoraciones", "aci_paquete_contratos", column: "nro_presup", primary_key: "nro_presupuesto", name: "valoraciones_contrato_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_valoraciones", "aci_rallies", column: "id_rally", primary_key: "id_rally", name: "valoraciones_rally_fk", on_update: :cascade, on_delete: :restrict
      add_foreign_key "aci_viajes_compras", "aci_paquete_contratos", column: "nro_presup", primary_key: "nro_presupuesto", name: "contrato_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "aci_viajes_compras", "aci_registros_viajeros", column: "nro_reg_v", primary_key: "nro_registro", name: "viajero_fk", on_update: :cascade, on_delete: :cascade
  end
end
