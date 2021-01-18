class CreateDetallesServicio < ActiveRecord::Migration[6.1]
  def change
    create_table :detalles_servicio do |t|

      t.timestamps
    end
  end
end
