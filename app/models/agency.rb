class Agency < ApplicationRecord
    has_many :paquetes
    has_many :a_p_hists
    has_many :ofertas
    has_many :registro_clientes
    has_many :empresa_proveedores, :through => :a_p_hists
    has_many :clientes, :through => :registro_clientes  
    

    validates :nombre_agencia, :url, :descripcion, :alcance, :tipo, presence: true
    validates :nombre_agencia, length: { minimum: 4 }
    validates :nombre_agencia, format: { with: /\A[\w\s]+\z/, #Ahora acepta espacios
        message: "no acepta caracteres especiales" }
    
        
    
end

