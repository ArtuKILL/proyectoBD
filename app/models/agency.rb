class Agency < ApplicationRecord
    
    has_many :socios, class_name: "Socio", foreign_key: "agencia1_id"
    has_many :socio2, class_name: "Socio", foreign_key: "agencia2_id"

    
    has_many :paquetes, :foreign_key => :id_agencia
    has_many :a_p_hists
    has_many :ofertas
    has_many :registro_clientes, :foreign_key =>:id_agencia, dependent: :destroy 
    has_many :empresa_proveedores, :through => :a_p_hists
    has_many :clientes, :through => :registro_clientes
    has_many :metodo_pagos
    has_many :registro_viajeros
    has_many :agencia_rallies
    has_many :rallies, :through => :agencia_rallies
    has_many :asesores
    has_many :viajeros, :through => :registro_clientes
    has_many :area_interes, :through => :areaint_e
      
    #accepts_nested_attributes_for :socios

    validates :nombre_agencia, :url, :descripcion, :alcance, :tipo, presence: true
    validates :nombre_agencia, length: { minimum: 4 }
    validates :nombre_agencia, format: { with: /\A[\w\s]+\z/, #Ahora acepta espacios
        message: "no acepta caracteres especiales" }
    
    def socio
      Socio.where("agencia1_id = ? OR agencia2_id = ?", self.id, self.id)
    end    
    
end

