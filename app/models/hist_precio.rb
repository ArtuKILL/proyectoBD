class HistPrecio < ApplicationRecord
    belongs_to :paquete, foreign_key: :id_paquete
end
