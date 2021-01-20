class AreaintE < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}areaint_es" # NOTE:  
    belongs_to :agency
end
