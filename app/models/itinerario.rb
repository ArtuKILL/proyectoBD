class Itinerario < ApplicationRecord
    belongs_to :paquete # TODO revisar entidad
    belongs_to :ciudad_localidad
end
