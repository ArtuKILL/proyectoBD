class Agency < ApplicationRecord

    validates :nombre_agencia, :url, :descripcion, :alcance, :tipo, presence: true
    validates :nombre_agencia, length: { minimum: 4 }
    validates :nombre_agencia, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }

    def index
         @agencies = Agency.all.select(:id_agencia)
    end
end
