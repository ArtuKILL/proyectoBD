class AlojamientoHotel < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}alojamientos_hoteles"
    has_many :servicio_hoteles
    has_many :detalle_servicios, :through => :servicio_hoteles
end
