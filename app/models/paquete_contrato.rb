class PaqueteContrato < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}paquete_contratos"
    belongs_to :registro_cliente, foreign_key: :nro_registro
    belongs_to :paquete
    belongs_to :asesor
    has_many :forma_pagos, foreign_key: :nro_presup
    has_many :metodo_pagos, :through => :forma_pagos
    has_many :viaje_compras
    has_many :registro_viajeros, :through => :viaje_compras
    has_many :valoraciones

end
