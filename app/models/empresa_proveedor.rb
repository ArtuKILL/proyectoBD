class EmpresaProveedor < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}empresas_proveedoras" 
    has_many :a_p_hists
    has_many :agencies, :through => :a_p_hists    
end
