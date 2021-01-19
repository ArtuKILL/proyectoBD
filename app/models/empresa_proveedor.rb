class EmpresaProveedor < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}empresas_prooveedoras" # TODO Quitarle la 'o' extra 
    has_many :a_p_hists
    has_many :agencies, :through => :a_p_hists    
end
