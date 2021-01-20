class Asesor < ApplicationRecord
    has_many :paquete_contratos
    belongs_to :agency
end
