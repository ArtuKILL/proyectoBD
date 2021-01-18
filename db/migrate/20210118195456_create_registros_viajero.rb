class CreateRegistrosViajero < ActiveRecord::Migration[6.1]
  def change
    create_table :registros_viajero, primary_key: "nro_registro", id: :bigint do |t|
      t.date :fecha_registro

      t.timestamps
    end
  end
end
