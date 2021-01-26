class FormaPago < ApplicationRecord
    belongs_to :metodo_pago, foreign_key: :id
    belongs_to :paquete_contrato, foreign_key: :nro_presup
end
