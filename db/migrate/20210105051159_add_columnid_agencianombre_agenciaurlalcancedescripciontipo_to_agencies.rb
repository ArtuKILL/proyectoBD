class AddColumnidAgencianombreAgenciaurlalcancedescripciontipoToAgencies < ActiveRecord::Migration[6.1]
  def change
    add_column :agencies, :id_agencia, :integer, limit: 2, :primary_key => :id_agencia, null: false
    add_column :agencies, :nombre_agencia, :string, limit: 35, null: false
    add_column :agencies, :url, :string, limit: 100, :null => false
    add_column :agencies, :alcance, :string, limit: 15, :null => false
    add_column :agencies, :descripcion, :text, :null => false
    add_column :agencies, :tipo, :string, limit: 25, :null => false
  end
end
