class Pais < ApplicationRecord
    has_many :ciudad_localidades
    has_many :pasaportes
    has_many :viajeros, :through => :pasaportes
end
