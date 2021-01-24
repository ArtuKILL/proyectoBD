class AreaInteres < ApplicationRecord
    has_many :areaint_es
    has_many :paquete, :through => :areaint_es
end
