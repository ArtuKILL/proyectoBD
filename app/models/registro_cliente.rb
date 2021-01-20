class RegistroCliente < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}registros_clientes"
end
