class CreatePaqueteContratos < ActiveRecord::Migration[6.1]
  def change
    create_table :paquete_contratos do |t|
      t.integer :nro_presupuesto
      t.date :fecha_emision
      t.decimal :total_calculado
      t.date :fecha_salida
      t.integer :nro_factura
      t.string :email_contacto

      t.timestamps
    end
  end
end
