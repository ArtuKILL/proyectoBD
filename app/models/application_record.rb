class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'aci_' # NOTE: Prefijo de las tablas
end
