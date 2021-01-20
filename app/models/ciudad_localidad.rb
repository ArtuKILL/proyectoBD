class CiudadLocalidad < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}ciudades_localidades"
    has_many :atracciones
    belongs_to :pais
end
