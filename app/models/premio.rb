class Premio < ApplicationRecord
    belongs_to :participante
    belongs_to :rally
end
