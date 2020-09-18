class Institution < ApplicationRecord
    validates :nome, presence: true
    validates :tipo, inclusion: { in: %w(Universidade Escola Creche), message: "Tipo de instituição inválido ou não informado." }
    validates :cnpj, numericality: { allow_nil: true, only_integer: true, greather_than: 0 } 
end
