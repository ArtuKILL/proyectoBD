class Paquete < ApplicationRecord
    belongs_to :agency, foreign_key: "id_agencia"
    has_many :paquete_contratos
    has_many :hist_precios
    has_many :detalle_servicios
    has_many :calendario_anuales
    has_many :areaint_es
    has_many :itinerarios
end
