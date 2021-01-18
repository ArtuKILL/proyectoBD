class RemoveTableTipos < ActiveRecord::Migration[6.1]
  def change
    drop_table :tipos
  end
end
