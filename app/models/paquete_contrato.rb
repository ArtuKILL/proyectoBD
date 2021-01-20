class PaqueteContrato < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}paquete_contratos"
end
