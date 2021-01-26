class Paquete < ApplicationRecord
    belongs_to :agency, foreign_key: "id_agencia"
    has_many :paquete_contratos
    has_many :hist_precios, foreign_key: :id_paquete
    has_many :detalle_servicios, foreign_key: :id_paquete
    has_many :calendario_anuales, foreign_key: :id_paquete
    has_many :areaint_es, foreign_key: :id_paquete
    has_many :itinerarios
    has_many :area_intereses, :through => :areaint_es
    has_many :asesores, :through => :areaint_es
    has_many :atracciones, :through => :areaint_es

    
end
