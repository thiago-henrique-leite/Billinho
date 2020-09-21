class Student < ApplicationRecord
    # Especifica a associação a classe enrollments
	has_many :enrollments

    # Realiza as validações necessárias
	validates :nome, presence: { message: "Nome do estudante não informado." }
	validates :cpf, numericality: { only_integer: true, message: "CPF não informado ou caracter inválido."} 
	validates :cpf, length: { is: 11, message: "Quantidade de dígitos incorreta." }
	validates :genero, inclusion: { in: %w(M F), message: "Gênero inválido ou não informado." }
	validates :meio_pagamento, inclusion: { in: %w(Cartão Boleto), message: "Meio de pagamento inválido ou não informado"}
end
