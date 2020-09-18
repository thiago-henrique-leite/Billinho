class Student < ApplicationRecord
	validates :nome, presence: true
	validates :cpf, numericality: { only_integer: true, greather_than: 10000000000, message: "CPF inválido ou não informado."} 
	validates :genero, inclusion: { in: %w(M F), message: "Gênero inválido ou não informado." }
	validates :meio_pagamento, inclusion: { in: %w(Cartão Boleto), message: "Meio de pagamento inválido ou não informado"}
end
