json.extract! paquete_contrato, :id, :nro_presupuesto, :fecha_emision, :total_calculado, :fecha_salida, :nro_factura, :email_contacto, :created_at, :updated_at
json.url paquete_contrato_url(paquete_contrato, format: :json)
