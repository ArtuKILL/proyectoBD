class DetalleServicio < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}detalles_servicios"
    belongs_to :paquete
    has_many :servicio_hoteles
    has_many :alojamiento_hoteles, :through => :servicio_hoteles
end
