class CreateTipos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipos do |t|
      t.string :numero
      t.string :email

      t.timestamps
    end
  end
end
