class CreateAtracciones < ActiveRecord::Migration[6.1]
  def change
    create_table :atracciones do |t|

      t.timestamps
    end
  end
end
