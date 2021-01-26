class AreaInteres < ApplicationRecord
    has_many :areaint_es, foreign_key: :id_interes
    has_many :paquetes, :through => :areaint_es
    has_many :areaint_es, foreign_key: :id_interes
    has_many :paquetes, :through => :areaint_es
end
