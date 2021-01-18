class CreateMetodosPago < ActiveRecord::Migration[6.1]
  def change
    create_table :metodos_pago, primary_key: "id_metodo", id: :bigint  do |t|
      t.string :tipo
      t.string :numero
      t.string :email

      t.timestamps
    end
  end
end
