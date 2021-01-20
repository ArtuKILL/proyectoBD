class Agency < ApplicationRecordexit
    has_many :socio1, class_name: "Socio", foreign_key: "agencia1_id"
    has_many :socio2, class_name: "Socio", foreign_key: "agencia2_id"
    has_many :paquetes
    has_many :a_p_hists
    has_many :empresa_proveedores, :through => :a_p_hists
    

    validates :nombre_agencia, :url, :descripcion, :alcance, :tipo, presence: true
    validates :nombre_agencia, length: { minimum: 4 }
    validates :nombre_agencia, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    
        
    
end

