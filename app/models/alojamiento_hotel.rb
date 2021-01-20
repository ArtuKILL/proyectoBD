class AlojamientoHotel < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}alojamientos_hoteles"
end
