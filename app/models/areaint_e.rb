class AreaintE < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}areaint_es" # NOTE:  
    belongs_to :agency
    belongs_to :area_interes
    belongs_to :paquete
    belongs_to :atraccion
end
