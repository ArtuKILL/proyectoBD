class AlojamientoHotel < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}alojamientos_hoteles"
    has_many :servicio_hoteles, foreign_key: "id_hotel" 
    has_many :detalle_servicios, :through => :servicio_hoteles

    accepts_nested_attributes_for :detalle_servicios
end
