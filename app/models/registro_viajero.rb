class RegistroViajero < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}registros_viajeros"
end
