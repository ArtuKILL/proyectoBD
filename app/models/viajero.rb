class Viajero < ApplicationRecord
    has_many :registro_viajeros
    has_many :agencies, :through => :registro_viajeros
    has_many :pasaportes
    has_many :paises, :through => :pasaportes

    validates :primer_nombre, :primer_apellido, :segundo_apellido, :genero, :correo_viajero, :fecha_nacimiento ,presence: true
    validates :primer_nombre, :primer_apellido, :segundo_apellido, length: { minimum: 2 }
    validates :primer_nombre, format: { with: /\A[\w\s]+\z/, #Ahora acepta espacios
        message: "no acepta caracteres especiales" }
end
