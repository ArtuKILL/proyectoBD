class Agency < ApplicationRecord
    has_many :socio1, class_name: "Socio", foreign_key: "agencia1_id"
    has_many :socio2, class_name: "Socio", foreign_key: "agencia2_id"
    has_many :paquetes
    has_many :a_p_hists
    has_many :ofertas
    has_many :registro_clientes
    has_many :empresa_proveedores, :through => :a_p_hists
    has_many :clientes, :through => :registro_clientes
    has_many :metodo_pagos
    has_many :registro_viajeros
    has_many :agencia_rallies
    has_many :rallies, :through => :agencia_rallies  
    

    validates :nombre_agencia, :url, :descripcion, :alcance, :tipo, presence: true
    validates :nombre_agencia, length: { minimum: 4 }
    validates :nombre_agencia, format: { with: /\A[\w\s]+\z/, #Ahora acepta espacios
        message: "no acepta caracteres especiales" }
    
        
    
end

