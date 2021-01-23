class RegistroCliente < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}registro_clientes"
    belongs_to :cliente, :foreign_key => "id_natriff"
    belongs_to :agency, :foreign_key => "id_agencia"
    has_many :participantes
    has_many :paquete_contratos
end
