class APHist < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}ap_hist"
    belongs_to :empresa_proveedor
    belongs_to :agency
end
