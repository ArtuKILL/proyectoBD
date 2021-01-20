class ItinerarioAtraccion < ApplicationRecord
    self.table_name = "#{self.table_name_prefix}itinerarios_atracciones"
end
