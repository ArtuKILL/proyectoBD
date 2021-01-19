class MetodoPago < ApplicationRecord
    self.table_name =  "#{self.table_name_prefix}metodos_pago"
    has_one :banco, foreign_key: "id"
end
