class RegistroCliente < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}registro_clientes"
    belongs_to :cliente
    belongs_to :agency
    has_many :participantes
end
