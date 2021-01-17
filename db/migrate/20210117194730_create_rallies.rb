class CreateRallies < ActiveRecord::Migration[6.1]
  def change
    create_table :rallies do |t|

      t.timestamps
    end
  end
end
