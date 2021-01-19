class Paquete < ApplicationRecord
    belongs_to :agencia, foreign_key: "id"
end
