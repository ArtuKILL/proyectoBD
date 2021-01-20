class ServicioHotel < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}servicios_hoteles"
    belongs_to :detalle_servicio
    belongs_to :alojamiento_hotel 
end
