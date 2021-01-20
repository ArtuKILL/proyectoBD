class ViajeCompra < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}viajes_compra"
end
