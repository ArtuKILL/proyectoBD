class DetalleServicio < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}detalles_servicios"
    belongs_to :paquete, foreign_key: :id_paquete
    has_many :servicio_hoteles, foreign_key: "id_servicio"
    has_many :alojamiento_hoteles, :through => :servicio_hoteles

    accepts_nested_attributes_for :alojamiento_hoteles
end
