class Atraccion < ApplicationRecord
    has_many :areaint_es
    belongs_to :ciudad_localidad
    has_many :atraccion_circuitos
    has_many :circuitos, :through => :atraccion_circuitos
end