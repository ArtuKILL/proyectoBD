class AddDetailsToCliente < ActiveRecord::Migration[6.1]
  def change
    add_column :clientes, :id_natrif, :string
    add_column :clientes, :nombre, :string
    add_column :clientes, :segundo_nombre, :string
    add_column :clientes, :primer_apellido, :string
    add_column :clientes, :segundo_apellido, :string
    add_column :clientes, :genero, :string
    add_column :clientes, :fecha_nac, :date
    add_column :clientes, :direccion, :string
    add_column :clientes, :tipo, :string
  end
end
