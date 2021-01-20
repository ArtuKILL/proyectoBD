class RegistroViajero < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}registros_viajeros"
    has_many :viaje_compras
    has_many :paquete_contratos, :through => :viaje_compras
    belongs_to :viajero
end
