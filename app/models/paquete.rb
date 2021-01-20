class Paquete < ApplicationRecord
    belongs_to :agencia, foreign_key: "id"
    has_many :paquete_contratos
    has_many :hist_precios
    has_many :detalle_servicios
    has_many :calendario_anuales
    has_many :areaint_es
end
