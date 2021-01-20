class PaqueteContrato < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}paquete_contratos"
    has_many :forma_pagos
    has_many :metodo_pagos, :through => :forma_pagos
end
