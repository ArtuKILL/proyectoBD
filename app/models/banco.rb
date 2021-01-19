class Banco < ApplicationRecord
    has_many :metodo_pagos, foreign_key: "id"
end
