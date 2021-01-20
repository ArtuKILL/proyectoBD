class Circuito < ApplicationRecord
    has_many :atraccion_circuitos
    has_many :atracciones

    belongs_to :ciudad_localidad
    belongs_to :rally
end
