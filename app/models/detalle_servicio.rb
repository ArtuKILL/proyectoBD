class DetalleServicio < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}detalles_servicios"
end
