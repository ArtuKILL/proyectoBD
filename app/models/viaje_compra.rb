class ViajeCompra < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}viajes_compras"
    belongs_to :paquete_contrato
    belongs_to :registro_viajero
end
