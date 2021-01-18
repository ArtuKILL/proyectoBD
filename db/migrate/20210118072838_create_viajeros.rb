class CreateViajeros < ActiveRecord::Migration[6.1]
  def change
    create_table :viajeros, primary_key: "id_viajero", id: :bigint do |t|
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :genero
      t.date :fecha_nacimiento
      t.string :correo_viajero

      t.timestamps
    end
  end
end
