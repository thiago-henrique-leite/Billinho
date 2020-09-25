class Institution < ApplicationRecord
  # Especifica a associação a classe enrollments
  has_many :enrollments, dependent: :destroy

  # Realiza as validações necessárias
  validates :nome, presence: { message: 'Nome da instituição não informado.' }
  validates :tipo, inclusion: { in: %w[Universidade Escola Creche], message: 'Tipo de instituição inválido ou não informado.' }
  validates :cnpj, numericality: { allow_nil: true, only_integer: true, message: 'Caracter inválido.' }
  validates :cnpj, length: { is: 14, allow_nil: true, message: 'Quantidade de dígitos incorreta.' }
end
