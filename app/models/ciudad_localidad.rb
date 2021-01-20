class CiudadLocalidad < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}ciudades_localidades"
end
