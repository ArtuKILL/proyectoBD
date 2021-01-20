class Viajero < ApplicationRecord
    has_many :registro_viajeros
    has_many :agencies, :through => :registro_viajeros
    has_many :pasaportes
    has_many :paises, :through => :pasaportes
end
