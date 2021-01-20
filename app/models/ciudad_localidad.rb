class CiudadLocalidad < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}ciudades_localidades"
    has_many :atracciones
    has_many :circuitos
    belongs_to :pais
end
