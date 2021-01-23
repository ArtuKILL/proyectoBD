class Cliente < ApplicationRecord
  
  has_many :registro_clientes, :foreign_key => :id_natriff, dependent: :destroy 
  has_many :agencies, :through => :registro_clientes
  
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
