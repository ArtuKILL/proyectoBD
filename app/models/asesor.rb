class Asesor < ApplicationRecord
    has_many :paquete_contratos
    has_many :areaint_es
    belongs_to :agency
end
