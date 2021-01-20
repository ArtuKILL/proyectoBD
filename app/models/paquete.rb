class Paquete < ApplicationRecord
    belongs_to :agencia, foreign_key: "id"
    has_many :paquete_contratos
    has_many :hist_precios
end
