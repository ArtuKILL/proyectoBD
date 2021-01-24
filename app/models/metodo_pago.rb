class MetodoPago < ApplicationRecord
    self.table_name =  "#{self.table_name_prefix}metodos_pago"
    has_one :banco
    belongs_to :cliente
    has_many :forma_pagos, foreign_key: :id
    has_many :paquete_contratos, :through => :forma_pagos
end
