class CalendarioAnual < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}calendarios_anuales"
    belongs_to :paquete
end
