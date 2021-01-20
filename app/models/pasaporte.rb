class Pasaporte < ApplicationRecord
    belongs_to :pais
    belongs_to :viajero
end
