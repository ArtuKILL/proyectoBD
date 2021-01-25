class Asesor < ApplicationRecord
    has_many :paquete_contratos
    has_many :areaint_es
    belongs_to :agency, foreign_key: :id_agencia
    has_many :paquete, :through => :areaint_es
end
