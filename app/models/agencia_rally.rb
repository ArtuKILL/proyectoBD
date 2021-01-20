class AgenciaRally < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}agencias_rallies"
    belongs_to :agency
    belongs_to :rally
end
