class Participante < ApplicationRecord
    belongs_to :registro_cliente
    belongs_to :registro_viajero
end
