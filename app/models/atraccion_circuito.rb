class AtraccionCircuito < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}atracciones_circuitos"
    belongs_to :circuito
    belongs_to :atraccion   
end
