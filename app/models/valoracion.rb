class Valoracion < ApplicationRecord
    belongs_to :rally
    belongs_to :ciudad_localidad
    belongs_to :pais
    belongs_to :atraccion
    belongs_to :paquete_contrato
end
