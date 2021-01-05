class CreateRegistroClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :registro_clientes do |t|
      t.integer :nro_registro
      t.date :fecha_registro

      t.timestamps
    end
  end
end
