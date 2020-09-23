class Student < ApplicationRecord
  # Especifica a associação a classe enrollments
	has_many :enrollments

	# Realiza as validações necessárias
	validates :nome, presence: { message: "Nome do estudante não informado." }
	validates :cpf, numericality: { only_integer: true, message: "CPF não informado ou caracter inválido." } 
	validates :cpf, length: { is: 11, message: "Quantidade de dígitos incorreta." } 
	validates :genero, inclusion: { in: %w(M F), message: "Gênero inválido ou não informado." }
  validates :meio_pagamento, inclusion: { in: %w(Cartão Boleto), message: "Meio de pagamento inválido ou não informado" }
  validate :data_valida?

  # Valida a data de nascimento do aluno
  private
  def data_valida?
    if self.data_nasc
      unless data_nasc.is_a?(Date)
        errors.add(:data_nasc, "Formato incorreto.")
      end
    end
  end
end
