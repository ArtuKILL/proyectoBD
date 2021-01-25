class ServicioHotel < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}servicios_hoteles"
    belongs_to :detalle_servicio, foreign_key: "id_servicio"
    belongs_to :alojamiento_hotel, foreign_key: "id_hotel" 

    accepts_nested_attributes_for :detalle_servicio, :alojamiento_hotel
end
