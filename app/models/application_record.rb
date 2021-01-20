class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = '' #Prefijo de las tablas
end
