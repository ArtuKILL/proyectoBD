class AddAgenciesRefToSocios < ActiveRecord::Migration[6.1]
  def change
    add_reference :socios, :agency , null: false, foreign_key: true
  end
end
