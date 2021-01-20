class Rally < ApplicationRecord
    has_many :participantes
    has_many :agencia_rallies
    has_many :agencies, :through => :agencia_rallies
    has_many :circuitos
    has_many :premios
end
