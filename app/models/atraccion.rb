class Atraccion < ApplicationRecord
    has_many :areaint_es
    belongs_to :ciudad_localidad
end
