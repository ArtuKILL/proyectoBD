class CreatePaquetes < ActiveRecord::Migration[6.1]
  def change
    create_table :paquetes do |t|

      t.timestamps
    end
  end
end
