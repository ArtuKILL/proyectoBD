class AreaintE < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}areaint_es" # NOTE:  
    has_one :agency
    belongs_to :area_interes, foreign_key: :id_interes
    has_one :paquete, foreign_key: :id_paquete
    has_one :atraccion
    has_one :asesor
end
