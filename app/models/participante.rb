class Participante < ApplicationRecord
    belongs_to :registro_cliente
    belongs_to :registro_viajero
    belongs_to :rally
    has_one :premio
end
