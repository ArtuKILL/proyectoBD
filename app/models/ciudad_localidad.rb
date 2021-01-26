class CiudadLocalidad < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}ciudades_localidades"
    has_many :atracciones
    has_many :circuitos
    has_many :valoraciones
    has_many :itinerarios
    belongs_to :pais, foreign_key: :id_pais
end
