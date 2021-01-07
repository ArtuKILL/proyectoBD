class CreateFormaPagos < ActiveRecord::Migration[6.1]
  def change
    create_table :forma_pagos do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
