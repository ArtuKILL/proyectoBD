require 'composite_primary_keys'

class Itinerario < ApplicationRecord
    has_many :itinerario_atracciones
    has_many :atracciones, :through => :itinerario_atracciones
    # FIXME: revisar esta entidad con itinerario atracion
    belongs_to :paquete 
    belongs_to :ciudad_localidad
end
