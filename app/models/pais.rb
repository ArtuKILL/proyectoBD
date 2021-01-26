class Pais < ApplicationRecord
    has_many :ciudad_localidades, foreign_key: :id_pais
    has_many :pasaportes
    has_many :valoraciones
    has_many :viajeros, :through => :pasaportes
end
