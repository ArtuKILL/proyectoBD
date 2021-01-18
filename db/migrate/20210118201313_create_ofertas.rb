class CreateOfertas < ActiveRecord::Migration[6.1]
  def change
    create_table :ofertas do |t|

      t.timestamps
    end
  end
end
