class CreateAlojamientoHoteles < ActiveRecord::Migration[6.1]
  def change
    create_table :alojamiento_hoteles, primary_key: "id_hotel", id: :bigint do |t|
      t.string :nombre_hotel

      t.timestamps
    end
  end
end
