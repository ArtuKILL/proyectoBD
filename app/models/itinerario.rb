class Itinerario < ApplicationRecord
    has_many :itinerario_atracciones
    has_many :atracciones, :through => :itinerario_atracciones
    # TODO: revisar esta entidad con itinerario atracion
    belongs_to :paquete 
    belongs_to :ciudad_localidad
end
