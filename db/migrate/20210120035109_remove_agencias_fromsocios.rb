class RemoveAgenciasFromsocios < ActiveRecord::Migration[6.1]
  def change
    remove_column :socios, :id_agencia, :bigint
  end
end
