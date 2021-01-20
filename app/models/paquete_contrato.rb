class PaqueteContrato < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}paquete_contratos"
    has_many :forma_pagos
    has_many :metodo_pagos, :through => :forma_pagos
    has_many :viaje_compras
    has_many :registro_viajeros, :through => :viaje_compras
end
