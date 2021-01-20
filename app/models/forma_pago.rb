class FormaPago < ApplicationRecord
    belongs_to :metodo_pago
    belongs_to :paquete_contrato
end
