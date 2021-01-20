class Circuito < ApplicationRecord
    has_many :atraccion_circuitos
    has_many :atracciones
end
