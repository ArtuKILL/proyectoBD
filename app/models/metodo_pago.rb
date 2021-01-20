class MetodoPago < ApplicationRecord
    self.table_name =  "#{self.table_name_prefix}metodos_pago"
    has_one :banco, foreign_key: "id"
    belongs_to :cliente
    has_many :forma_pagos
    has_many :paquete_contratos, :through => :forma_pagos
end
