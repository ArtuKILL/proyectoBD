class AddFkToSocios < ActiveRecord::Migration[6.1]
  add_reference :socios, :agencia1, references: :agencies, index: true
  add_reference :socios, :agencia2, references: :agencies, index: true
end
