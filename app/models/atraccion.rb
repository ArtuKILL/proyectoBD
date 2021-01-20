class Atraccion < ApplicationRecord
    has_many :areaint_es
    has_many :atraccion_circuitos
    has_many :valoraciones
    has_many :circuitos, :through => :atraccion_circuitos
    has_many :itinerario_atracciones
    has_many :itinerarios, :through => :itinerario_atracciones

    belongs_to :ciudad_localidad
end