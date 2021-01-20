class Socio < ApplicationRecord
    belongs_to :agencia1, :class_name => 'Agency', :foreign_key => :agencia1_id
    belongs_to :agencia2, :class_name => 'Agency', :foreign_key => :agencia2_id
end
