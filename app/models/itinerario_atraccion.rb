class ItinerarioAtraccion < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}itinerarios_atracciones"
    belongs_to :itinerario
    belongs_to :atraccion 
    # FIXME: Arreglar 
end
